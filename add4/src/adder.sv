module adder (
    input  [31:0] operand_a, operand_b,
    output [31:0] adder_data,
    output carry
);
 logic not_b;
assign not_b = ~operand_b;

//assign {carry, adder_data} = 32'h0000_0001 + 32'hFFFF_FFFD + 1;
assign {carry, adder_data} = operand_a + not_b + 1;

endmodule