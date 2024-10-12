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
        //    $writememh("Mem_after.data",inst_lsu.data_mem);
           $finish(); 
        end
        
    end

 
endmodule