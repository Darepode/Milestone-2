`timescale 1ns/1ps
module adder_tb ();
    logic [31:0] operand_a, operand_b;
    logic [31:0] adder_data;

    adder inst_adder(
        .operand_a (operand_a),
        .operand_b (operand_b),
        .adder_data (adder_data)       
    );

    // Wave dump
    initial begin
        $dumpfile("adder_tb.vcd");
        $dumpvars(0,adder_tb);
    end

    // File log dump
    integer fd;
    initial begin
        fd = $fopen("result.log","w");
    end

    logic [31:0] a, b;
    
    // Simulation
    initial begin
        integer t = 14;
        forever begin 
            #10 
            //t = $time;
            a = $random(t);
            b = $random(t);
            adder(a, b);
            #1 
            if (!(adder_tb.inst_adder.adder_data == (adder_tb.inst_adder.operand_a + adder_tb.inst_adder.operand_b)))   
                $fdisplay(fd, "ERROR !!! at: %0t, mine: %0d, expected: %0d, op1: %0d, op2: %0d", $time,adder_tb.inst_adder.adder_data,(a + b),a,b);
            else
                $fdisplay(fd, "At: %0t, mine: %0d, expected: %0d, op1: %0d, op2: %0d", $time,adder_tb.inst_adder.adder_data,(a + b),a,b);
            if ($time > 1500) begin
                a = 32'd19;
                b = 32'd4;
                adder(a, b);
                #1
                $display("At %0t, mine: %0d, expected: %0d, op1: %0d, op2: %0d",$time,adder_tb.inst_adder.adder_data,a + b,a,b);
                $finish;
            end
        end
    end

    // Task
    task automatic adder(input [31:0] in1, input [31:0] in2);
        adder_tb.operand_a = in1;
        adder_tb.operand_b = in2;
    endtask

endmodule