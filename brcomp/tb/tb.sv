`timescale 1ns/1ps
// module tb ();
//     logic  [31:0] rs1_data, rs2_data;
//     logic  [0:0]  br_unsigned;
//     logic  [0:0]  br_less, br_equal;

//     brcomp inst_brcomp(
//         .rs1_data    (rs1_data),
//         .rs2_data    (rs2_data),
//         .br_unsigned (br_unsigned),
//         .br_less     (br_less),
//         .br_equal    (br_equal)  
//     );

//     // Wave dump
//     initial begin
//         $dumpfile("tb.vcd");
//         $dumpvars(0,tb);
//         #1000 $finish();
//     end

//     integer seed1, seed2;

//     initial begin
//         seed1 = 12;
//         seed2 = 6;
//         forever begin
//         #5
//         rs1_data = $random(seed1);
//         rs2_data = $random(seed2);
//         br_unsigned = $urandom_range(0,1);
//         if (br_unsigned) begin
//             if (!(br_equal == (rs1_data == rs2_data))) $display("Error in unsigned equal");
//             else if (!(br_less == (rs1_data < rs2_data))) $display("Error in unsigned less than");
//         end else begin
//             if (!(br_equal == ($signed(rs1_data) == $signed(rs2_data)))) $display("Error in signed equal");
//             else if (!(br_less == ($signed(rs1_data) < $signed(rs2_data)))) $display("Error in signed less than");
//         end
//         end
//     end
// endmodule

module tb ();
    logic[31:0] a, b;
    logic eq, lt;
    logic un;

    logic[1:0] expected;
    int un_errors = 0;
    int s_errors = 0;

    brcomp dut(a, b, un, lt, eq);

    initial begin
        for (int i = 0; i < 2**17; i++) begin
            {a, b, un} = $urandom;
            // compare sign numbers
            if (!un) begin
                expected = {a == b, a < b};
            end else begin
                expected = {a == b, $signed(a) < $signed(b)};
            end
            
            #1;
            if (expected !== {eq, lt}) begin
                if(un == 0) begin
                    $display("Error: un = %b, a = %d, b = %d, result = %b, expected = %b",
                            un, a, b, {eq, lt}, expected);
                    un_errors++;
                end
                else begin
                    $display("Error: un = %b, a = %d, b = %d, result = %b, expected = %b",
                            un, $signed(a), $signed(b), {eq, lt}, expected);
                    s_errors++;
                end
            end
            #1;
        end
        $display("Test finished with %3d unsigned errors.", un_errors);
        $display("Test finished with %3d signed errors.", s_errors);
    end
endmodule