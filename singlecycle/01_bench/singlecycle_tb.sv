`timescale 1ns/1ps
module singlecycle_tb ();

    logic        i_clk;
    logic        i_rst_n;
    logic [31:0] i_io_sw;
    logic [3:0]  i_io_btn;

    logic [31:0] o_pc_debug;
    logic        o_insn_vld;
    logic [31:0] o_io_ledr;
    logic [31:0] o_io_ledg;
    logic [6:0]  o_io_hex0;
    logic [6:0]  o_io_hex1;
    logic [6:0]  o_io_hex2;
    logic [6:0]  o_io_hex3;
    logic [6:0]  o_io_hex4;
    logic [6:0]  o_io_hex5;
    logic [6:0]  o_io_hex6;
    logic [6:0]  o_io_hex7;
    logic [31:0] o_io_lcd;

    logic [31:0] reg0;
    logic [31:0] reg1;
    logic [31:0] reg2;
    logic [31:0] reg3;
    logic [31:0] reg4;
    logic [31:0] reg5;
    logic [31:0] reg6;
    logic [31:0] reg7;
    logic [31:0] reg8;
    logic [31:0] reg9;
    logic [31:0] reg10;
    logic [31:0] reg11;
    logic [31:0] reg12;
    logic [31:0] reg13;
    logic [31:0] reg14;
    logic [31:0] reg15;
    logic [31:0] reg16;
    logic [31:0] reg17;
    logic [31:0] reg18;
    logic [31:0] reg19;
    logic [31:0] reg20;
    logic [31:0] reg21;
    logic [31:0] reg22;
    logic [31:0] reg23;
    logic [31:0] reg24;
    logic [31:0] reg25;
    logic [31:0] reg26;
    logic [31:0] reg27;
    logic [31:0] reg28;
    logic [31:0] reg29;
    logic [31:0] reg30;
    logic [31:0] reg31;

    assign reg0  = singlecycle_inst.regfile_inst.register[0];
    assign reg1  = singlecycle_inst.regfile_inst.register[1];
    assign reg2  = singlecycle_inst.regfile_inst.register[2];
    assign reg3  = singlecycle_inst.regfile_inst.register[3];
    assign reg4  = singlecycle_inst.regfile_inst.register[4];
    assign reg5  = singlecycle_inst.regfile_inst.register[5];
    assign reg6  = singlecycle_inst.regfile_inst.register[6];
    assign reg7  = singlecycle_inst.regfile_inst.register[7];
    assign reg8  = singlecycle_inst.regfile_inst.register[8];
    assign reg9  = singlecycle_inst.regfile_inst.register[9];
    assign reg10 = singlecycle_inst.regfile_inst.register[10];
    assign reg11 = singlecycle_inst.regfile_inst.register[11];
    assign reg12 = singlecycle_inst.regfile_inst.register[12];
    assign reg13 = singlecycle_inst.regfile_inst.register[13];
    assign reg14 = singlecycle_inst.regfile_inst.register[14];
    assign reg15 = singlecycle_inst.regfile_inst.register[15];
    assign reg16 = singlecycle_inst.regfile_inst.register[16];
    assign reg17 = singlecycle_inst.regfile_inst.register[17];
    assign reg18 = singlecycle_inst.regfile_inst.register[18];
    assign reg19 = singlecycle_inst.regfile_inst.register[19];
    assign reg20 = singlecycle_inst.regfile_inst.register[20];
    assign reg21 = singlecycle_inst.regfile_inst.register[21];
    assign reg22 = singlecycle_inst.regfile_inst.register[22];
    assign reg23 = singlecycle_inst.regfile_inst.register[23];
    assign reg24 = singlecycle_inst.regfile_inst.register[24];
    assign reg25 = singlecycle_inst.regfile_inst.register[25];
    assign reg26 = singlecycle_inst.regfile_inst.register[26];
    assign reg27 = singlecycle_inst.regfile_inst.register[27];
    assign reg28 = singlecycle_inst.regfile_inst.register[28];
    assign reg29 = singlecycle_inst.regfile_inst.register[29];
    assign reg30 = singlecycle_inst.regfile_inst.register[30];
    assign reg31 = singlecycle_inst.regfile_inst.register[31];


singlecycle singlecycle_inst (
    .i_clk      (i_clk),
    .i_rst_n    (i_rst_n),
    .i_io_sw    (i_io_sw),
    .i_io_btn   (i_io_btn),
    .o_pc_debug (o_pc_debug),
    .o_insn_vld (o_insn_vld),
    .o_io_ledr  (o_io_ledr),
    .o_io_ledg  (o_io_ledg),
    .o_io_hex0  (o_io_hex0),
    .o_io_hex1  (o_io_hex1),
    .o_io_hex2  (o_io_hex2),
    .o_io_hex3  (o_io_hex3),
    .o_io_hex4  (o_io_hex4),
    .o_io_hex5  (o_io_hex5),
    .o_io_hex6  (o_io_hex6),
    .o_io_hex7  (o_io_hex7),
    .o_io_lcd   (o_io_lcd)
);



    // Clock gen
    initial begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk;
    end

    // Reset gen
    initial begin
        i_rst_n = 0;
        #10 i_rst_n = 1;
    end

    // Wave dump
    initial begin
        $dumpfile("singlecycle_tb.vcd");
        $dumpvars(0,singlecycle_tb);
        #1000 begin
           $writememh("Mem_after.data", singlecycle_tb.singlecycle_inst.lsu_inst.data_mem);
           $writememh("Out_Mem_after.data", singlecycle_tb.singlecycle_inst.lsu_inst.output_mem);
           $writememh("In_Mem_after.data", singlecycle_tb.singlecycle_inst.lsu_inst.input_mem);
           $finish(); 
        end
        
    end
    
    // Initilize memory
    initial begin
    $display("BEGIN init mem");
    $readmemh("../02_test/test_in.hex", singlecycle_tb.singlecycle_inst.imem_inst.instr_mem);
    $display("FINISH init mem");
    #10; force singlecycle_tb.singlecycle_inst.lsu_inst.i_io_sw = 32'hDEADBEEF;
    end

 
endmodule