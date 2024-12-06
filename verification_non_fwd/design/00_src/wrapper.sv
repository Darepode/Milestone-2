module wrapper (
    input  logic        CLOCK_50,      // Global clock, active on the rising edge
    input  logic [17:0] SW,    // Input for switches
    input  logic [3:0]  KEY,   // Input for buttons
    output logic [17:0] LEDR,  // Output for driving red LEDs
    output logic [8:0]  LEDG,  // Output for driving green LEDs
    output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,   // Output for driving 7-segment LED displays
	 output logic [0:0]  SRAM_WE_N,SRAM_UB_N,SRAM_LB_N,SRAM_CE_N,
	 input  logic        SRAM_OE_N,
	 output logic [17:0] SRAM_ADDR,
	 inout wire   [15:0] SRAM_DQ,
    output logic [12:0] LCD    // Output for driving the LCD register
//	 output logic [31:0] PC_out
//	 output logic state_out,
//	 output logic mem_ack_out,
//	 output logic true_mem_rden_out, true_mem_wren_out,
//    output logic sram_state_q_out, sram_rden_out, sram_wren_out
);

logic clk_div, clk_div1;
reg Q1, Q2;

// Clock divider 1/2
always@(posedge CLOCK_50 or negedge SW[17]) begin
	if (!SW[17]) begin
		clk_div1 <= 1'b0;
		end
	else 
		
		clk_div1 <= ~clk_div1;
end

always@(posedge clk_div1 or negedge SW[17]) begin
	if (!SW[17]) begin
		clk_div <= 1'b0;
		end
	else 
		clk_div <= ~clk_div;
end

// Reset synchronizer
always @(posedge clk_div or negedge SW[17]) begin
	if (!SW[17]) begin
		Q1 <= 1'b0;
		Q2 <= 1'b0;
	end else begin
		Q1 <= 1'b1;
		Q2 <= Q1;
	end
end


singlecycle singlecycle_inst (
        .i_clk(clk_div),                // Connect clock input
        .i_rst_n(Q2),                   // Connect reset input
        .i_io_sw({{15{1'd0}},SW[16:0]}),// Connect switches input
        .i_io_btn(KEY),                 // Connect buttons input
        .o_pc_debug(),                  // Connect program counter output to pc_debug signal
        .o_insn_vld(),                  // Connect instruction valid output to insn_vld signal
        .o_io_ledr({{14{1'd0}},LEDR}),  // Connect red LEDs output to io_ledr signal
        .o_io_ledg({{23{1'd0}},LEDG}),  // Connect green LEDs output to io_ledg signal
        .o_io_hex0(HEX0),               // Leave hex0 connection blank
        .o_io_hex1(HEX1),               // Leave hex1 connection blank
        .o_io_hex2(HEX2),               // Leave hex2 connection blank
        .o_io_hex3(HEX3),               // Leave hex3 connection blank
        .o_io_hex4(HEX4),               // Leave hex4 connection blank
        .o_io_hex5(HEX5),               // Leave hex5 connection blank
        .o_io_hex6(HEX6),               // Leave hex6 connection blank
        .o_io_hex7(HEX7),               // Leave hex7 connection blank
        .o_io_lcd ({LCD[12], LCD[11], {19{1'd0}}, LCD[10:0]}),  // Connect LCD output to io_lcd signal

		  // SRAM ports connections
		  .o_sram_we_n   (SRAM_WE_N), 
        .i_sram_oe_n   (SRAM_OE_N), 
        .o_sram_ub_o   (SRAM_UB_N), 
        .o_sram_lb_n   (SRAM_LB_N), 
        .o_sram_ce_n   (SRAM_CE_N), 
        .o_sram_addr   (SRAM_ADDR), 
        .io_sram_dq    (SRAM_DQ)
		  
//		  .PC_out			(PC_out),
//		  .state_out      (state_out),
//		  .mem_ack_out    (mem_ack_out),
//		  .true_mem_rden_out (true_mem_rden_out), 
//		  .true_mem_wren_out (true_mem_wren_out),
//		  .sram_state_q_out (sram_state_q_out),
//		  .sram_wren_out (sram_wren_out),
//		  .sram_rden_out (sram_rden_out)
);

	

endmodule