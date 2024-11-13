module alu (
    input  [31:0] i_operand_a, i_operand_b,
    input  [3:0]  i_alu_op,
    output [31:0] o_alu_data
);
logic [31:0] temp,temp_sll,temp_srl,temp_sra, not_b;
logic [31:0] alu_temp;
logic [0:0]  carry, overflow, signed_lt, unsigned_lt;

assign not_b = ~i_operand_b;
assign {carry, temp} = i_operand_a + not_b + 1;
assign overflow     = (i_operand_a[31] ^ i_operand_b[31]) & (i_operand_a[31] ^ temp[31]);
assign signed_lt    = temp[31] ^ overflow;
assign unsigned_lt  = ~carry;

sll u1(
    .i_operand_a(i_operand_a),
    .i_operand_b(i_operand_b),
    .o_sll_data(temp_sll)
);
srl u2(
    .i_operand_a(i_operand_a),
    .i_operand_b(i_operand_b),
    .o_srl_data(temp_srl)
);
sra u3(
    .i_operand_a(i_operand_a),
    .i_operand_b(i_operand_b),
    .o_sra_data(temp_sra)
);

always @(*) begin
    case (i_alu_op)
        4'h0: alu_temp = i_operand_a + i_operand_b;
        4'h1: alu_temp = temp;
        4'h2: alu_temp = {31'h0, signed_lt};
        4'h3: alu_temp = {31'h0, unsigned_lt};
        4'h4: alu_temp = i_operand_a ^ i_operand_b;
        4'h5: alu_temp = i_operand_a | i_operand_b;
        4'h6: alu_temp = i_operand_a & i_operand_b;
        4'h7: alu_temp = temp_sll;
        4'h8: alu_temp = temp_srl;
        4'h9: alu_temp = temp_sra;
        4'hA: alu_temp = i_operand_b;
    default: alu_temp = 32'h00000000; 
    endcase
end

assign o_alu_data = alu_temp;
endmodule