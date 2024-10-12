module immgen (
	input [31:0] instruction_i,
    output reg [31:0] immediate_o	
);


parameter  R_type      = 5'b01100,
	       I_type_LD   = 5'b00000,
	       I_type_IMM  = 5'b00100,
	       I_type_JALR = 5'b11001,
	       S_type      = 5'b01000,
	       B_type      = 5'b11000,
	       U_type      = 5'b01101,
	       J_type      = 5'b11011;

//wire opcode [4:0];

//assign opode = instruction_i[6:2];

always @(*) begin
	case (instruction_i[6:2])
		R_type      : immediate_o = 32'h00000000;

		I_type_LD   : immediate_o = { {20{instruction_i[31]}}, instruction_i[31:20] };
		I_type_IMM  : immediate_o = { {20{instruction_i[31]}}, instruction_i[31:20] };
		I_type_JALR : immediate_o = { {20{instruction_i[31]}}, instruction_i[31:20] };

		S_type      : immediate_o = { {20{instruction_i[31]}}, instruction_i[31:25], instruction_i[11:7] };
		B_type      : immediate_o = { {20{instruction_i[31]}}, instruction_i[7], instruction_i[30:25], instruction_i[11:8], 1'b0 };
		U_type      : immediate_o = { instruction_i[31:12], 12'b000000000000 };
		J_type      : immediate_o = { {11{instruction_i[31]}}, instruction_i[31], instruction_i[19:12], instruction_i[20], instruction_i[30:21], 1'b0 };	
		default     : immediate_o = 32'h00000000;
	endcase

end

endmodule