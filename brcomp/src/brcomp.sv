module brcomp (
    input  [31:0] rs1_data, rs2_data,
    input  [0:0]  br_unsigned,
    output [0:0]  br_less, br_equal
);
    logic [31:0] sub;
    logic overflow, carry;
    logic [0:0] br_equal_reg, br_less_reg;
    assign {carry,sub} = rs1_data + ~rs2_data + 32'b1;
    assign overflow = (rs1_data[31] ^ rs2_data[31]) & (rs1_data[31] ^ sub[31]); 

    always @(*) begin
        if (br_unsigned) begin
            br_less_reg = carry;
            br_equal_reg = (!sub) ? 1 : 0;
        end else begin
            br_less_reg = sub[31] ^ overflow;
            br_equal_reg = (!sub) ? 1 : 0;
        end
    end

    assign br_less = br_less_reg;
    assign br_equal = br_equal_reg;
endmodule