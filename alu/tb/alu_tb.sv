`timescale 1ns/1ps
module alu_tb ();
    logic [31:0] operand_a, operand_b;
    logic [3:0]  alu_op;
    logic [31:0] alu_data,expected_data;

    alu inst_alu(
        .i_operand_a (operand_a),
        .i_operand_b (operand_b),
        .i_alu_op    (alu_op),
        .o_alu_data  (alu_data)       
    );

    // Wave dump
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0,alu_tb);
       // #100000 $finish();
    end
    
    integer fd;
    initial begin      
        fd = $fopen("result.log","w");
    end

    integer seed = 1234;
    string op_string;

    // Simulation
    initial begin
        forever begin 
            #10 
            alu_op = $urandom_range(0, 10);
            operand_a = $random(seed);
            operand_b = (!(alu_op == 4'h7 || alu_op == 4'h8 || alu_op == 4'h9 )) ? $random(seed) : $urandom_range(0,31);
            expected_gen(operand_a,operand_b,alu_op,expected_data,op_string);
            #5
            if (!(alu_op==4'h2))
                $fdisplay(fd,"\n\nAt %0t on op %0d\na = %0d, b = %0d",$time,alu_op, operand_a, operand_b);
            else
                $fdisplay(fd,"\n\nAt %0t on op %0d\na = %0d, b = %0d",$time,alu_op, $signed(operand_a), $signed(operand_b));
            $fwrite(fd,"Result -> DUT_data = %0d, Expected_data = %0d",alu_data,expected_data);
            if (alu_data != expected_data)
                $fdisplay(fd," => ERROR on %s !!! ",op_string);
            if ($time > 10000) begin
                operand_a = 32'd4218972406;// 32'hA5FFFFFF; 
                operand_b = 32'h00000009; //9        
                alu_op = 4'h9;  //4294818868
                expected_gen(operand_a,operand_b,alu_op,expected_data,op_string);
                #5
                $display("At %0t on op %s, a = %h, b = %h, DUT_data = %h, Expected_data = %h",$time,op_string, operand_a, operand_b,alu_data,expected_data);
                operand_a = 32'd18972406;
                operand_b = -32'd32464538;       
                alu_op = 4'h2; 
                expected_gen(operand_a,operand_b,alu_op,expected_data,op_string);
                #5
                $display("At %0t on op %s, a = %0d, b = %0d, DUT_data = %0b, Expected_data = %0b",$time,op_string, $signed(operand_a), $signed(operand_b),alu_data,expected_data);
                $finish;
            end

        end
    end

    // Task
    task automatic expected_gen(input [31:0] in1, input [31:0] in2, input [3:0] op, output [31:0] out, output string s);
        case (op)
            4'h0: begin
                    out = in1 + in2;
                    s = "ADD";
            end
            4'h1: begin
                    out = in1 - in2;
                    s = "SUB";
            end
            4'h2: begin
                    out = ($signed(in1) < $signed(in2)) ? 32'h1 : 32'h0;
                    s = "SLT"; 
            end
            4'h3: begin
                    out = (in1 < in2) ? 32'h1 : 32'h0;
                    s = "SLTU"; 
            end
            4'h4: begin
                    out = in1 ^ in2;
                    s = "XOR";
            end
            4'h5: begin
                    out = in1 | in2;
                    s = "OR";
            end
            4'h6: begin
                    out = in1 & in2;
                    s = "AND";
            end
            4'h7: begin
                    out = in1 << in2[4:0];
                    s = "SLL"; 
            end
            4'h8: begin
                    out = in1 >> in2[4:0];
                     s = "SRL"; 
            end
            4'h9: begin
                    out = $signed(in1) >>> in2[4:0];
                    s = "SRA"; 
                    end
            4'hA: begin
                    out = in2;
                    s = "Operand_b"; 
            end
            default: begin
                    out = 32'b0;
                    s = "ERROR --> INVALID OP";
            end
        endcase
    endtask

endmodule