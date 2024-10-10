`timescale 1ns/1ps
module tb ();
    logic  [31:0] rs1_data, rs2_data;
    logic  [0:0]  br_unsigned;
    logic  [0:0]  br_less, br_equal;

    brcomp inst_brcomp(
        .rs1_data    (rs1_data),
        .rs2_data    (rs2_data),
        .br_unsigned (br_unsigned),
        .br_less     (br_less),
        .br_equal    (br_equal)  
    );

    // Wave dump
    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0,tb);
        #1000 $finish();
    end

    integer seed1, seed2;

    initial begin
        seed1 = 12;
        seed2 = 6;
        #5
        rs1_data = $random(seed1);
        rs2_data = $random(seed2);
        br_unsigned = $urandom_range(0,1);
        if (br_unsigned) begin
            if (!(br_equal == (rs1_data == rs2_data))) $display("Error in unsigned equal");
            else if (!(br_less == (rs1_data < rs2_data))) $display("Error in unsigned less than");
        end else begin
            if (!(br_equal == ($signed(rs1_data) == $signed(rs2_data)))) $display("Error in signed equal");
            else if (!(br_less == ($signed(rs1_data) < $signed(rs2_data)))) $display("Error in signed less than");
        end
    end
endmodule