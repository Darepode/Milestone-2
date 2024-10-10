module ctrl_unit (
	input  wire [31:0] instr,
	input  wire [0:0]  br_less, br_equal,
    output reg  [0:0]  br_sel, br_unsigned, rd_wren, mem_wren, op_a_sel, op_b_sel,o_insn_vld,
	output reg  [1:0]  wb_sel
);
wire [6:0] func7;
wire [2:0] func3;
parameter  R_type       = 7'b0110011,
	       I_type_LD    = 7'b0000011,
	       I_type_IMM   = 7'b0010011,
	       I_type_JALR  = 7'b1100111,
	       S_type       = 7'b0100011,
	       B_type       = 7'b1100011,
	       U_type_LUI   = 7'b0110111,
		   U_type_AUIPC = 7'b0110111,
	       J_type       = 7'b1101111;

assign func7 = instr[31:25];
assign func3 = instr[14:12]; 

always @(*) begin
	case (instr[6:0])
		R_type      : begin
			          br_sel <= 1'b0; br_unsigned <= 1'b0; rd_wren <= 1'b1; mem_wren <= 1'b0; op_a_sel <= 1'b0; op_b_sel <= 1'b0; wb_sel <= 2'b00;
					  case (func3)
						3'b000: alu_op <= (func7[5]) ? 4'b0000 : 4'b0001;
						3'b001: alu_op <= 4'b0111;
						3'b010: alu_op <= 4'b0010;
						3'b011: alu_op <= 4'b0011;
						3'b100: alu_op <= 4'b0100;
						3'b101: alu_op <= (func7[5]) ? 4'b1000 : 4'b1001;
						3'b110: alu_op <= 4'b0101;
						3'b111: alu_op <= 4'b0110;
					  endcase
		end
		I_type_IMM  : begin
			          br_sel <= 1'b0; br_unsigned <= 1'b0; rd_wren <= 1'b1; mem_wren <= 1'b0; op_a_sel <= 1'b0; op_b_sel <= 1'b1; wb_sel <= 2'b00;
					  case (func3)
					    3'b000: alu_op <= 4'b0000;
						3'b010: alu_op <= 4'b0010;
						3'b011: alu_op <= 4'b0011;
						3'b100: alu_op <= 4'b0100;
						3'b110: alu_op <= 4'b0101;
						3'b111: alu_op <= 4'b0110;
						3'b001: alu_op <= 4'b0111;
						3'b101: alu_op <= (func7[5]) ? 4'b1000 : 4'b1001;
					  endcase
		end
		I_type_JALR : begin
			          br_sel <= 1'b0; br_unsigned <= 1'b0; rd_wren <= 1'b1; mem_wren <= 1'b0; op_a_sel <= 1'b0; op_b_sel <= 1'b0; wb_sel <= 2'b10;
					  alu_op <= 4'b0000;
		end
		I_type_LD   : begin
			          br_sel <= 1'b0; br_unsigned <= 1'b0; rd_wren <= 1'b1; mem_wren <= 1'b0; op_a_sel <= 1'b0; op_b_sel <= 1'b0; wb_sel <= 2'b01;
					  alu_op <= 4'b0000;
		end
        B_type      : begin
                      br_sel <= 1'b1;  rd_wren <= 1'b0; mem_wren <= 1'b0; op_a_sel <= 1'b1; op_b_sel <= 1'b1; wb_sel <= 2'b00; alu_op <= 4'b0000;
                      case (func3)
					    3'b000: br_unsigned <= 1'b0;
						3'b001: br_unsigned <= 1'b0;
						3'b100: br_unsigned <= 1'b0;
						3'b101: br_unsigned <= 1'b0;
						3'b110: br_unsigned <= 1'b1;
						3'b111: br_unsigned <= 1'b1;
					  endcase  
		end
		S_type      : begin
                      br_sel <= 1'b0;  br_unsigned <= 1'b0; rd_wren <= 1'b0; mem_wren <= 1'b1; op_a_sel <= 1'b0; op_b_sel <= 1'b1; wb_sel <= 2'b00; alu_op <= 4'b0000;
		end
		J_type      : begin
                      br_sel <= 1'b1;  br_unsigned <= 1'b0; rd_wren <= 1'b1; mem_wren <= 1'b0; op_a_sel <= 1'b1; op_b_sel <= 1'b1; wb_sel <= 2'b10; alu_op <= 4'b0000;
		end
		U_type_LUI  : begin
                      br_sel <= 1'b0;  br_unsigned <= 1'b0; rd_wren <= 1'b1; mem_wren <= 1'b0; op_a_sel <= 1'b0; op_b_sel <= 1'b1; wb_sel <= 2'b00; alu_op <= 4'b1010;
		end
		U_type_AUIPC: begin
                      br_sel <= 1'b0;  br_unsigned <= 1'b0; rd_wren <= 1'b1; mem_wren <= 1'b0; op_a_sel <= 1'b1; op_b_sel <= 1'b1; wb_sel <= 2'b00; alu_op <= 4'b0000;
		end
		default: o_insn_vld = 1'b1;
                    
	endcase

end

endmodule