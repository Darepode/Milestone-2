module ctrl_unit (
	input  wire [31:0] instr,
	input  wire [0:0]  br_less, br_equal, 
	output reg  [2:0]  l_length,
    output reg  [0:0]  br_sel, br_unsigned, rd_wren, mem_wren, op_a_sel, op_b_sel, insn_vld,  l_unsigned,
	output reg  [1:0]  wb_sel, s_length,
	output reg  [3:0]  alu_op
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
		   U_type_AUIPC = 7'b0010111,
	       J_type       = 7'b1101111;

assign func7 = instr[31:25];
assign func3 = instr[14:12];

always @(*) begin
	case (instr[6:0])
		R_type      : begin
					  if (!(func7 == 7'b0 || func7 == 7'b0100000)) begin
						br_sel = 1'b0; br_unsigned = 1'b0; rd_wren = 1'b0; mem_wren = 1'b0; op_a_sel = 1'b0; op_b_sel = 1'b0; wb_sel = 2'b00;
					    l_unsigned = 1'b0; l_length = 3'b0; s_length = 2'b0; insn_vld = 1'b0;
					  end else begin
						br_sel = 1'b0; br_unsigned = 1'b0; rd_wren = 1'b1; mem_wren = 1'b0; op_a_sel = 1'b0; op_b_sel = 1'b0; wb_sel = 2'b00;
					  l_unsigned = 1'b0; l_length = 3'b0; s_length = 2'b0; insn_vld = 1'b1;
					  end
						case (func3)
							3'b000: alu_op = (!func7[5]) ? 4'b0000 : 4'b0001;
							3'b001: alu_op = 4'b0111;
							3'b010: alu_op = 4'b0010;
							3'b011: alu_op = 4'b0011;
							3'b100: alu_op = 4'b0100;
							3'b101: alu_op = (!func7[5]) ? 4'b1000 : 4'b1001;
							3'b110: alu_op = 4'b0101;
							3'b111: alu_op = 4'b0110;
						endcase
		end
		I_type_IMM  : begin
			          br_sel = 1'b0; br_unsigned = 1'b0; rd_wren = 1'b1; mem_wren = 1'b0; op_a_sel = 1'b0; op_b_sel = 1'b1; wb_sel = 2'b00;
					  l_unsigned = 1'b0; l_length = 3'b0; s_length = 2'b0; insn_vld = 1'b1;
					  case (func3)
					    3'b000: alu_op = 4'b0000;
						3'b010: alu_op = 4'b0010;
						3'b011: alu_op = 4'b0011;
						3'b100: alu_op = 4'b0100;
						3'b110: alu_op = 4'b0101;
						3'b111: alu_op = 4'b0110;
						3'b001: alu_op = 4'b0111;
						3'b101: alu_op = (!func7[5]) ? 4'b1000 : 4'b1001;
					  endcase
		end
		I_type_JALR : begin
			          br_sel = 1'b1; br_unsigned = 1'b0; rd_wren = 1'b1; mem_wren = 1'b0; op_a_sel = 1'b0; op_b_sel = 1'b0; wb_sel = 2'b10;
					  alu_op = 4'b0000; l_unsigned = 1'b0; l_length = 3'b0; s_length = 2'b0; insn_vld = 1'b1;
		end
		I_type_LD   : begin
			          br_sel = 1'b0; br_unsigned = 1'b0; rd_wren = 1'b1; mem_wren = 1'b0; op_a_sel = 1'b0; op_b_sel = 1'b1; wb_sel = 2'b01;
					  alu_op = 4'b0000; s_length = 2'b0; l_length = func3; insn_vld = 1'b1;
					  if (func3 == 3'b100 || func3 == 3'b101) l_unsigned = 1'b1;
					  else l_unsigned = 1'b0;
		end
        B_type      : begin
                      /*br_sel = 1'b1;*/  rd_wren = 1'b0; mem_wren = 1'b0; op_a_sel = 1'b1; op_b_sel = 1'b1; wb_sel = 2'b00; alu_op = 4'b0000;
					  l_unsigned = 1'b0; l_length = 3'b0; s_length = 2'b0; insn_vld = 1'b1;
                      case (func3)
					    3'b000: begin   // beq
							br_unsigned = 1'b0;
							if (br_equal & !br_less) br_sel = 1'b1;
							else br_sel = 1'b0;
						end
						3'b001: begin  //bne
							br_unsigned = 1'b0;
							if (!br_equal & !br_less) br_sel = 1'b1;
							else br_sel = 1'b0;
						end
						3'b100: begin   //blt
							br_unsigned = 1'b0;
							if (!br_equal & br_less) br_sel = 1'b1;
							else br_sel = 1'b0;
						end
						3'b101: begin   //bge
							br_unsigned = 1'b0;
							if (!br_less) br_sel = 1'b1;
							else br_sel = 1'b0;
						end
						3'b110: begin   //bltu
							br_unsigned = 1'b1;
							if (!br_equal & br_less) br_sel = 1'b1;
							else br_sel = 1'b0;
						end
						3'b111: begin   //bgeu
							br_unsigned = 1'b1;
							if (!br_less) br_sel = 1'b1;
							else br_sel = 1'b0;
						end
					  endcase  
		end
		S_type      : begin
                      br_sel = 1'b0;  br_unsigned = 1'b0; rd_wren = 1'b0; mem_wren = 1'b1; op_a_sel = 1'b0; op_b_sel = 1'b1; wb_sel = 2'b00; alu_op = 4'b0000;
					  s_length = func3[1:0]; l_unsigned = 1'b0; l_length = 3'b0; insn_vld = 1'b1;
					  
		end
		J_type      : begin
                      br_sel = 1'b1;  br_unsigned = 1'b0; rd_wren = 1'b1; mem_wren = 1'b0; op_a_sel = 1'b1; op_b_sel = 1'b1; wb_sel = 2'b10; alu_op = 4'b0000;
					  l_unsigned = 1'b0; l_length = 3'b0; s_length = 2'b0; insn_vld = 1'b1;
		end
		U_type_LUI  : begin
                      br_sel = 1'b0;  br_unsigned = 1'b0; rd_wren = 1'b1; mem_wren = 1'b0; op_a_sel = 1'b0; op_b_sel = 1'b1; wb_sel = 2'b00; alu_op = 4'b1010;
					  l_unsigned = 1'b0; l_length = 3'b0; s_length = 2'b0; insn_vld = 1'b1;
		end
		U_type_AUIPC: begin
                      br_sel = 1'b0;  br_unsigned = 1'b0; rd_wren = 1'b1; mem_wren = 1'b0; op_a_sel = 1'b1; op_b_sel = 1'b1; wb_sel = 2'b00; alu_op = 4'b0000;
					  l_unsigned = 1'b0; l_length = 3'b0; s_length = 2'b0; insn_vld = 1'b1;
		end
		default: begin
			br_sel = 1'b0; br_unsigned = 1'b0; rd_wren = 1'b0; mem_wren = 1'b0; op_a_sel = 1'b0; op_b_sel = 1'b0; wb_sel = 2'b00;
			l_unsigned = 1'b0; l_length = 3'b0; s_length = 2'b0; insn_vld = 1'b0;
		 	//insn_vld = 1'b1;
		end
                    
	endcase

end

endmodule