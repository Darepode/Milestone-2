module singlecycle (
    input  logic i_clk,             // Global clock, active on the rising edge
    input  logic i_rst_n,           // Global low active reset
    input  logic [31:0] i_io_sw,    // Input for switches
    input  logic [3:0] i_io_btn     // Input for buttons
    output logic [31:0] o_pc_debug, // Debug program counter
    output logic o_insn_vld,        // Instruction valid
    output logic [31:0] o_io_ledr,  // Output for driving red LEDs
    output logic [31:0] o_io_ledg,  // Output for driving green LEDs
    output logic [6:0] o_io_hex0, o_io_hex1, o_io_hex2, o_io_hex3, o_io_hex4, o_io_hex5, o_io_hex6, o_io_hex7,   // Output for driving 7-segment LED displays
    output logic [31:0] o_io_lcd,   // Output for driving the LCD register
);
hellow


endmodule
