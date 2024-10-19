module singlecycle (
    input  logic        i_clk,      // Global clock, active on the rising edge
    input  logic        i_rst_n,    // Global low active reset
    input  logic [31:0] i_io_sw,    // Input for switches
    input  logic [3:0]  i_io_btn,   // Input for buttons
    output logic [31:0] o_pc_debug, // Debug program counter
    output logic        o_insn_vld, // Instruction valid
    output logic [31:0] o_io_ledr,  // Output for driving red LEDs
    output logic [31:0] o_io_ledg,  // Output for driving green LEDs
    output logic [6:0]  o_io_hex0, o_io_hex1, o_io_hex2, o_io_hex3, o_io_hex4, o_io_hex5, o_io_hex6, o_io_hex7,   // Output for driving 7-segment LED displays
    output logic [31:0] o_io_lcd    // Output for driving the LCD register
);

reg  [31:0] PC_reg;
wire [31:0] pc_next, pc_four, instr, wb_data, rs1_data, rs2_data, operand_a, operand_b, immediate, alu_data, ld_data, io_btn, io_sw;
wire [0:0]  pc_sel, rd_wren, insn_vld, br_un, br_less, br_equal, opa_sel, opb_sel, mem_wren, l_unsigned;
wire [1:0]  wb_sel, s_length;
wire [2:0]  l_length;
wire [3:0]  alu_op;

assign pc_next   = (!pc_sel)  ? pc_four  : alu_data;
assign operand_a = (!opa_sel) ? rs1_data : PC_reg;
assign operand_b = (!opb_sel) ? rs2_data : immediate;
assign wb_data   = (!wb_sel)  ? alu_data : (wb_sel == 2'b01) ? ld_data: pc_four;

always@( posedge i_clk) begin
    if (!i_rst_n) begin
        PC_reg <= 32'h00000000;
        o_pc_debug <= 32'h00000000;
        o_insn_vld <= 1'h0;
    end
    else begin
        PC_reg <= pc_next;
        o_pc_debug <= PC_reg;
        o_insn_vld <= insn_vld;
    end
end

adder adder4_inst (
    .operand_a  (PC_reg),    
    .operand_b  (32'h4),    
    .adder_data (pc_four)     
);

imem imem_inst (
    .i_addr (PC_reg),
    .o_data (instr)
);

regfile regfile_inst (
    .clk_i    (i_clk),            
    .rd_wren  (rd_wren),          
    .rst_ni   (i_rst_n),           
    .rd_addr  (instr[11:7]),          
    .rs1_addr (instr[19:15]),         
    .rs2_addr (instr[24:20]),         
    .rd_data  (wb_data),          
    .rs1_data (rs1_data),         
    .rs2_data (rs2_data)          
);

immgen immgen_inst (
    .instruction_i(instr),    
    .immediate_o  (immediate)       
);

brcomp brcomp_inst (
    .rs1_data    (rs1_data),    
    .rs2_data    (rs2_data),    
    .br_unsigned (br_un),    
    .br_less     (br_less),    
    .br_equal    (br_equal)     
);

alu alu_inst (
    .i_operand_a (operand_a),    
    .i_operand_b (operand_b),    
    .i_alu_op    (alu_op),    
    .o_alu_data  (alu_data)     
);

lsu lsu_inst (
    .i_clk        (i_clk),    
    .i_rst_n      (i_rst_n),     
    .i_lsu_wren   (mem_wren),    
    .i_l_unsigned (l_unsigned),    
    .i_l_length   (l_length),    
    .i_s_length   (s_length),     
    .i_lsu_addr   (alu_data),    
    .i_st_data    (rs2_data),    
    .i_io_sw      (io_sw),    
    .i_io_btn     (io_btn),    
    .o_ld_data    (ld_data),    
    .o_io_lcd     (o_io_lcd),    
    .o_io_ledg    (o_io_ledg),    
    .o_io_ledr    (o_io_ledr),    
    .o_io_hex0    (o_io_hex0),    
    .o_io_hex1    (o_io_hex1),    
    .o_io_hex2    (o_io_hex2),    
    .o_io_hex3    (o_io_hex3),    
    .o_io_hex4    (o_io_hex4),    
    .o_io_hex5    (o_io_hex5),    
    .o_io_hex6    (o_io_hex6),    
    .o_io_hex7    (o_io_hex7)     
);

ctrl_unit ctrl_unit_inst (
    .instr       (instr),    
    .br_less     (br_less),    
    .br_equal    (br_equal), 
    .l_length    (l_length),   
    .br_sel      (pc_sel),    
    .br_unsigned (br_un),    
    .rd_wren     (rd_wren),    
    .mem_wren    (mem_wren),    
    .op_a_sel    (opa_sel),    
    .op_b_sel    (opb_sel),    
    .insn_vld    (insn_vld),  
    .l_unsigned  (l_unsigned),  
    .wb_sel      (wb_sel),
    .s_length    (s_length),
    .alu_op      (alu_op)     
);

endmodule
