`timescale 1ns/1ps
module tb ();
    logic         clk_i, w_en_i, rst_ni;
    logic  [5:0]  w_addr_i, r_addr_1_i, r_addr_2_i;
    logic  [31:0] w_data_i;
    logic  [31:0] r_data_1_o, r_data_2_o;

    logic [31:0] read_reg_0;
    logic [31:0] read_reg_1;
    logic [31:0] read_reg_2;
    logic [31:0] read_reg_3;
    logic [31:0] read_reg_4;
    logic [31:0] read_reg_5;
    logic [31:0] read_reg_6;
    logic [31:0] read_reg_7;
    logic [31:0] read_reg_8;
    logic [31:0] read_reg_9;
    logic [31:0] read_reg_10;
    logic [31:0] read_reg_11;
    logic [31:0] read_reg_12;
    logic [31:0] read_reg_13;
    logic [31:0] read_reg_14;
    logic [31:0] read_reg_15;
    logic [31:0] read_reg_16;
    logic [31:0] read_reg_17;
    logic [31:0] read_reg_18;
    logic [31:0] read_reg_19;
    logic [31:0] read_reg_20;
    logic [31:0] read_reg_21;
    logic [31:0] read_reg_22;
    logic [31:0] read_reg_23;
    logic [31:0] read_reg_24;
    logic [31:0] read_reg_25;
    logic [31:0] read_reg_26;
    logic [31:0] read_reg_27;
    logic [31:0] read_reg_28;
    logic [31:0] read_reg_29;
    logic [31:0] read_reg_30;
    logic [31:0] read_reg_31;

    assign read_reg_0  = tb.inst_reg_file.register[0];
    assign read_reg_1  = tb.inst_reg_file.register[1];
    assign read_reg_2  = tb.inst_reg_file.register[2];
    assign read_reg_3  = tb.inst_reg_file.register[3];
    assign read_reg_4  = tb.inst_reg_file.register[4];
    assign read_reg_5  = tb.inst_reg_file.register[5];
    assign read_reg_6  = tb.inst_reg_file.register[6];
    assign read_reg_7  = tb.inst_reg_file.register[7];
    assign read_reg_8  = tb.inst_reg_file.register[8];
    assign read_reg_9  = tb.inst_reg_file.register[9];
    assign read_reg_10 = tb.inst_reg_file.register[10];
    assign read_reg_11 = tb.inst_reg_file.register[11];
    assign read_reg_12 = tb.inst_reg_file.register[12];
    assign read_reg_13 = tb.inst_reg_file.register[13];
    assign read_reg_14 = tb.inst_reg_file.register[14];
    assign read_reg_15 = tb.inst_reg_file.register[15];
    assign read_reg_16 = tb.inst_reg_file.register[16];
    assign read_reg_17 = tb.inst_reg_file.register[17];
    assign read_reg_18 = tb.inst_reg_file.register[18];
    assign read_reg_19 = tb.inst_reg_file.register[19];
    assign read_reg_20 = tb.inst_reg_file.register[20];
    assign read_reg_21 = tb.inst_reg_file.register[21];
    assign read_reg_22 = tb.inst_reg_file.register[22];
    assign read_reg_23 = tb.inst_reg_file.register[23];
    assign read_reg_24 = tb.inst_reg_file.register[24];
    assign read_reg_25 = tb.inst_reg_file.register[25];
    assign read_reg_26 = tb.inst_reg_file.register[26];
    assign read_reg_27 = tb.inst_reg_file.register[27];
    assign read_reg_28 = tb.inst_reg_file.register[28];
    assign read_reg_29 = tb.inst_reg_file.register[29];
    assign read_reg_30 = tb.inst_reg_file.register[30];
    assign read_reg_31 = tb.inst_reg_file.register[31];

    regfile inst_reg_file (
        .clk_i       (clk_i),
        .rd_wren      (w_en_i),
        .rst_ni      (rst_ni),
        .rd_addr    (w_addr_i),
        .rs1_addr  (r_addr_1_i),
        .rs2_addr  (r_addr_2_i),
        .rd_data    (w_data_i),
        .rs1_data  (r_data_1_o),
        .rs2_data  (r_data_2_o)
    );

    // Clock gen
    initial begin
        clk_i = 0;
        forever #5 clk_i = ~clk_i;
    end

    // Reset gen
    initial begin
        rst_ni = 0;
        #10 rst_ni = 1;
    end

    // Wave dump
    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0,tb);
        #1000 $finish();
    end

    // Simulation write
    initial begin
        #16
        write(1,0,123);
        #5
        write(1,0,111);
        forever #10 write(1, $urandom_range(1, 31), $urandom_range(-1000, 1000));
    end

    // Simulation read
    initial begin
        #50
        read(7,8);
    end

    // Write task
    task write(input en, input [5:0] addr, input [31:0] data);
        tb.w_en_i = en;
        tb.w_addr_i = addr;
        tb.w_data_i = data;
    endtask

    // Read task
    task read(input [5:0] addr1, input [5:0] addr2);
        tb.r_addr_1_i = addr1;
        tb.r_addr_2_i = addr2;
    endtask

endmodule