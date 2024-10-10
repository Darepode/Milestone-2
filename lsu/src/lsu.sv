module lsu (
    input             i_clk, i_rst_n, st_en, i_lsu_wren, i_unsigned,
    input  [1:0]      i_l_length, i_s_length, 
    input  [2:0]      i_funct3,
    input  [11:0]     i_lsu_addr,
    input  [31:0]     i_st_data, i_io_sw, i_io_btn,
    output reg [31:0] o_ld_data, o_io_lcd, o_io_ledg, o_io_ledr,
                       
    output reg [6:0]  o_io_hex0, o_io_hex1, o_io_hex2, o_io_hex3,
                      o_io_hex4, o_io_hex5, o_io_hex6, o_io_hex7
);

    wire [2:0] cs;
    wire [31:0] data_mem_out, output_mem_out;

    // Declare memory space
    reg [7:0] data_mem[0:8191];
    reg [7:0] input_mem[0:31];
    reg [7:0] output_mem[0:63];

    assign data_mem_addr   = i_lsu_addr[12:0];
    assign input_mem_addr  = i_lsu_addr[4:0];
    assign output_mem_addr = i_lsu_addr[5:0];

    // Mapping for output memory
    assign o_io_ledr = {output_mem[6'b00_0000+6'h3], output_mem[6'b00_0000+6'h2], output_mem[6'b00_0000+6'h1], output_mem[6'b00_0000]};
    assign o_io_ledg = {output_mem[6'b01_0000+6'h3], output_mem[6'b01_0000+6'h2], output_mem[6'b01_0000+6'h1], output_mem[6'b01_0000]};

    assign o_io_hex0 = output_mem[6'b10_0000][6:0];
    assign o_io_hex1 = output_mem[6'b10_0001][6:0];
    assign o_io_hex2 = output_mem[6'b10_0010][6:0];
    assign o_io_hex3 = output_mem[6'b10_0011][6:0];
    assign o_io_hex4 = output_mem[6'b10_0100][6:0];
    assign o_io_hex5 = output_mem[6'b10_0101][6:0];
    assign o_io_hex6 = output_mem[6'b10_0110][6:0];
    assign o_io_hex7 = output_mem[6'b10_0111][6:0];

    assign o_io_lcd  = {output_mem[6'b11_0000+6'h3], output_mem[6'b11_0000+6'h2], output_mem[6'b11_0000+6'h1], output_mem[6'b11_0000]}; 

    // Mapping for input memory
    // assign i_io_sw   = {input_mem[5'b0_0000+5'h3], input_mem[5'b0_0000+5'h2], input_mem[5'b0_0000+5'h1], input_mem[5'b0_0000]};
    // assign i_io_btn  = input_mem[5'b1_0000][3:0];

    // Load-Store for data_mem
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            for (integer i = 0; i < 8192, i = i+1) data_mem[i] <= 8'h00;
        end esle begin
            if (cs[0] & i_lsu_wren) begin
                // Store word 
                if (i_s_length == 2'b10) {data_mem[data_mem_addr+13'h3], data_mem[data_mem_addr+13'h2], data_mem[data_mem_addr+13'h1], data_mem[data_mem_addr]} <= i_st_data;
                //Store half-word
                esle if (i_s_length == 2'b01) {data_mem[data_mem_addr+13'h1], data_mem[data_mem_addr]} <= i_st_data[15:0];
                //Store byte
                esle if (i_s_length == 2'b00) data_mem[data_mem_addr] <= i_st_data[7:0];
            end
        end
    end
    // Output of data_mem
    assign data_mem_out = {data_mem[data_mem_addr+12'h3], data_mem[data_mem_addr+12'h2], data_mem[data_mem_addr+12'h1], data_mem[data_mem_addr]};

    // Load-Store for output_mem
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            for (integer i = 0; i < 64, i = i+1) data_mem[i] <= 8'h00;
        end esle begin
            if (cs[1] & i_lsu_wren) begin
                // Store word 
                if (i_s_length == 2'b10) {data_mem[data_mem_addr+13'h3], data_mem[data_mem_addr+13'h2], data_mem[data_mem_addr+13'h1], data_mem[data_mem_addr]} <= i_st_data;
                //Store half-word
                esle if (i_s_length == 2'b01) {data_mem[data_mem_addr+13'h1], data_mem[data_mem_addr]} <= i_st_data[15:0];
                //Store byte
                esle if (i_s_length == 2'b00) data_mem[data_mem_addr] <= i_st_data[7:0];
            end
        end
    end
    // Output of output_mem
    assign output_mem_out = {output_mem[output_mem_addr+6'h3], output_mem[output_mem_addr+6'h2], output_mem[output_mem_addr+6'h1], output_mem[output_mem_addr]};

    // Load-Store for input_mem
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            for (integer i = 0; i < 32, i = i+1) input_mem[i] <= 8'h00;
        end esle begin
            {input_mem[5'b0_0000+5'h3], input_mem[5'b0_0000+5'h2], input_mem[5'b0_0000+5'h1], input_mem[5'b0_0000]}; <= assign i_io_sw;
            input_mem[5'b1_0000] <= {4'b0, i_io_btn};
        end
    end
    // Output of input_mem
    assign input_mem_out = {input_mem[input_mem_addr+6'h3], input_mem[input_mem_addr+6'h2], input_mem[input_mem_addr+6'h1], input_mem[input_mem_addr]};

    // assign io_hex0 = {data_mem[12'h800+12'h3], data_mem[12'h800+12'h2], data_mem[12'h800+12'h1], data_mem[12'h800]};
    // assign io_hex1 = {data_mem[12'h810+12'h3], data_mem[12'h810+12'h2], data_mem[12'h810+12'h1], data_mem[12'h810]};
    // assign io_hex2 = {data_mem[12'h820+12'h3], data_mem[12'h820+12'h2], data_mem[12'h820+12'h1], data_mem[12'h820]};
    // assign io_hex3 = {data_mem[12'h830+12'h3], data_mem[12'h830+12'h2], data_mem[12'h830+12'h1], data_mem[12'h830]};
    // assign io_hex4 = {data_mem[12'h840+12'h3], data_mem[12'h840+12'h2], data_mem[12'h840+12'h1], data_mem[12'h840]};
    // assign io_hex5 = {data_mem[12'h850+12'h3], data_mem[12'h850+12'h2], data_mem[12'h850+12'h1], data_mem[12'h850]};
    // assign io_hex6 = {data_mem[12'h860+12'h3], data_mem[12'h860+12'h2], data_mem[12'h860+12'h1], data_mem[12'h860]};
    // assign io_hex7 = {data_mem[12'h870+12'h3], data_mem[12'h870+12'h2], data_mem[12'h870+12'h1], data_mem[12'h870]};
    // assign io_ledr = {data_mem[12'h880+12'h3], data_mem[12'h880+12'h2], data_mem[12'h880+12'h1], data_mem[12'h880]};
    // assign io_ledg = {data_mem[12'h890+12'h3], data_mem[12'h890+12'h2], data_mem[12'h890+12'h1], data_mem[12'h890]};
    // assign io_lcd  = {data_mem[12'h8A0+12'h3], data_mem[12'h8A0+12'h2], data_mem[12'h8A0+12'h1], data_mem[12'h8A0]};
    // assign io_sw   = {data_mem[12'h900+12'h3], data_mem[12'h900+12'h2], data_mem[12'h900+12'h1], data_mem[12'h900]};

    always @(posedge clk_i) begin
        // Reset
        if (!rst_ni) begin
            for (integer i = 0; i < 12'hFFF; i = i+1) begin
                data_mem[i] <= 8'b0;
            end
        end
        else begin
            if (st_en) begin 
                if ((12'h9FF < addr) || (addr < 12'h900)) {data_mem[addr+12'h3], data_mem[addr+12'h2], data_mem[addr+12'h1], data_mem[addr]} <= st_data;
                else {data_mem[addr+12'h3], data_mem[addr+12'h2], data_mem[addr+12'h1], data_mem[addr]} <= io_sw;
            end
        end
    end

    ld_data <= {data_mem[addr+12'h3], data_mem[addr+12'h2], data_mem[addr+12'h1], data_mem[addr]};

endmodule