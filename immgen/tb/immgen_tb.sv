`timescale 1ns/1ps
module immgen_tb ();
    logic [31:0] operand_a, operand_b;
    logic [3:0]  alu_op;
    logic [31:0] alu_data;

    alu inst_alu(
        .operand_a (operand_a),
        .operand_b (operand_b),
        .alu_op (alu_op),
        .alu_data (alu_data)       
    );

    // Wave dump
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0,alu_tb);
    end

    logic [31:0] a, b;
    logic [3:0] c;
    
    // Simulation
    initial begin
        integer t = 14;
        forever begin 
            #10 
            //t = $time;
            a = $random(t);
            b = $random(t);
            c = $urandom_range(0, 9);
            alu(a, b, c);
            case (alu_op)
                4'h0: #1 if (!(alu_tb.inst_alu.alu_data == (alu_tb.inst_alu.operand_a + alu_tb.inst_alu.operand_b)))   $display("Error on op: %0d, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,alu_tb.inst_alu.alu_data,(a + b),a,b);
                4'h1: #1 if (!(alu_tb.inst_alu.alu_data == (alu_tb.inst_alu.operand_a - alu_tb.inst_alu.operand_b)))   $display("Error on op: %0d, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,alu_tb.inst_alu.alu_data,(a - b),a,b);
                4'h2: #1 if (!(alu_tb.inst_alu.alu_data == ($signed(alu_tb.inst_alu.operand_a) < $signed(alu_tb.inst_alu.operand_b))))   $display("Error on op: %0d, at %0t, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,$time,alu_tb.inst_alu.alu_data,($signed(a) < $signed(b)),$signed(a),$signed(b));
                4'h3: #1 if (!(alu_tb.inst_alu.alu_data == (alu_tb.inst_alu.operand_a < alu_tb.inst_alu.operand_b)))   $display("Error on op: %0d, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,alu_tb.inst_alu.alu_data,(a < b),a,b);
                4'h4: #1 if (!(alu_tb.inst_alu.alu_data == (alu_tb.inst_alu.operand_a ^ alu_tb.inst_alu.operand_b)))   $display("Error on op: %0d, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,alu_tb.inst_alu.alu_data,(a ^ b),a,b);
                4'h5: #1 if (!(alu_tb.inst_alu.alu_data == (alu_tb.inst_alu.operand_a | alu_tb.inst_alu.operand_b)))   $display("Error on op: %0d, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,alu_tb.inst_alu.alu_data,(a | b),a,b);
                4'h6: #1 if (!(alu_tb.inst_alu.alu_data == (alu_tb.inst_alu.operand_a & alu_tb.inst_alu.operand_b)))   $display("Error on op: %0d, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,alu_tb.inst_alu.alu_data,(a & b),a,b);
                4'h7: #1 if (!(alu_tb.inst_alu.alu_data == (alu_tb.inst_alu.operand_a << alu_tb.inst_alu.operand_b)))  $display("Error on op: %0d, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,alu_tb.inst_alu.alu_data,(a << b),a,b);
                4'h8: #1 if (!(alu_tb.inst_alu.alu_data == (alu_tb.inst_alu.operand_a >> alu_tb.inst_alu.operand_b)))  $display("Error on op: %0d, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,alu_tb.inst_alu.alu_data,(a >> b),a,b);
                4'h9: #1 if (!(alu_tb.inst_alu.alu_data == (alu_tb.inst_alu.operand_a >>> alu_tb.inst_alu.operand_b))) $display("Error on op: %0d, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,alu_tb.inst_alu.alu_data,(a >>> b),a,b);
                default: $display("default %0d",c); 
            endcase
            if ($time > 1500) begin
                    a = 32'd1944211405;
                    b = -32'd61167976;
                    c = 32'h2;
                    alu(a, b, c);
                    #5
                    $display("Op: %0d,at %0t, mine: %0d, expected: %0d, op1: %0d, op2: %0d",c,$time,alu_tb.inst_alu.alu_data,($signed(a) < $signed(b)),$signed(a),$signed(b));
                    $finish;
            end
        end
    end

    // Task
    task automatic alu(input [31:0] in1, input [31:0] in2, input [3:0] op);
        alu_tb.operand_a = in1;
        alu_tb.operand_b = in2;
        alu_tb.alu_op = op;    
    endtask

endmodule