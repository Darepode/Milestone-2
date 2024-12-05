module regfile (
    input         clk_i, rd_wren, rst_ni,
    input  [4:0]  rd_addr, rs1_addr, rs2_addr,
    input  [31:0] rd_data,
    output [31:0] rs1_data, rs2_data
);
    
// Register file initialization
    reg [31:0] register[0:31];

// Write operation
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            for (integer i = 0; i < 32; i++) begin
                register[i] <= '0;
            end
            //$writememh("regfile.data", register);
        end else if (rd_wren && rd_addr) register[rd_addr] <= rd_data;
        //$writememh("regfile.data", register);
    end

// Read operation
    assign rs1_data = register[rs1_addr];
    assign rs2_data = register[rs2_addr];

endmodule