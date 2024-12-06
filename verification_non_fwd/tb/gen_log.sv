import package_decode::*;
`include "task_gen_log.svh"
module gen_log (
    input clk_i
);
    // Logging data
    wire [31:0] pc;
    wire [4:0]  reg_num;
    wire [31:0] data, instr;
    wire [11:0] ls_addr;
    wire [31:0] l_data, s_data;
    logic [2:0]  mem_type;
    // Logging flags
    wire is_branch, is_load, is_store, is_jump;
    wire [2:0] ls_size; // 001: word; 010: half; 100: byte

    // Logging data connection
    assign pc = tb.non_fwd_inst.MEMWB_pc;
    assign reg_num = tb.non_fwd_inst.MEMWB_instr[11:7];
    assign data = tb.non_fwd_inst.WB_rd_data;
    assign instr = tb.non_fwd_inst.MEMWB_instr;
    assign ls_addr = tb.non_fwd_inst.MEMWB_alu_data;
    assign l_data = tb.non_fwd_inst.MEMWB_lsu_rdata;
    assign s_data = tb.non_fwd_inst.MEMWB_s_data;
    // assign mem_type = tb.non_fwd_inst.lsu_inst.cs;

    // Open log file
    integer fd;
    initial begin
        fd = $fopen("/home/giahuy/ctmt/milestone2/Milestone-2/verification_non_fwd/logs/core_log.log","w");
    end

    // Logging flag connection
    assign is_branch = ((instr & MASK_BEQ) == EXPT_BEQ ||
                        (instr & MASK_BLT) == EXPT_BLT ||
                        (instr & MASK_BLTU) == EXPT_BLTU ||
                        (instr & MASK_BNE) == EXPT_BNE ||
                        (instr & MASK_BGE) == EXPT_BGE ||
                        (instr & MASK_BGEU) == EXPT_BGEU
                       );
    assign is_load = ((instr & MASK_LW) == EXPT_LW ||
                      (instr & MASK_LH) == EXPT_LH ||
                      (instr & MASK_LB) == EXPT_LB ||
                      (instr & MASK_LHU) == EXPT_LHU ||
                      (instr & MASK_LBU) == EXPT_LBU);

    assign is_store = ((instr & MASK_SW) == EXPT_SW ||
                       (instr & MASK_SH) == EXPT_SH ||
                       (instr & MASK_SB) == EXPT_SB);
    
    assign ls_size[0] = (instr & MASK_LW) == EXPT_LW || (instr & MASK_SW) == EXPT_SW;
    assign ls_size[1] = (instr & MASK_LH) == EXPT_LH || (instr & MASK_LHU) == EXPT_LHU || (instr & MASK_SH) == EXPT_SH;
    assign ls_size[2] = (instr & MASK_LB) == EXPT_LB || (instr & MASK_LBU) == EXPT_LBU || (instr & MASK_SB) == EXPT_SB;

    assign is_jump = (instr & MASK_JAL) == EXPT_JAL || (instr & MASK_JALR) == EXPT_JALR || (instr & MASK_AUIPC) == EXPT_AUIPC;

    assign mem_type[0] = (tb.non_fwd_inst.MEMWB_alu_data[15:13] == 3'b001);
    assign mem_type[1] = (tb.non_fwd_inst.MEMWB_alu_data[15:6] == 10'b0111_0000_00);
    assign mem_type[2] = (tb.non_fwd_inst.MEMWB_alu_data[15:5] == 11'b0111_1000_000); 

    // Logging process
    always @(posedge clk_i) begin

        if(tb.non_fwd_inst.o_insn_vld) begin
        if (is_branch) begin
            log2file_branch(fd, pc, instr);
        end else if (is_load) begin
            log2file_load(fd, pc, instr, reg_num, l_data, ls_addr, mem_type, ls_size);
        end else if (is_store) begin
            log2file_store(fd, pc, instr, s_data, ls_addr, mem_type, ls_size);
        end else if (is_jump) begin
            log2file_jump(fd, pc, instr, reg_num, data);
        end else log2file_default(fd, pc, instr, reg_num, data);
        end
    end

endmodule