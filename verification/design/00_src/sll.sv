module sll (
    input  [31:0] i_operand_a,
    input  [31:0] i_operand_b,
    output reg [31:0] o_sll_data
);

    always @(*) begin
        case (i_operand_b[4:0])
            5'd0:  o_sll_data = i_operand_a;
            5'd1:  o_sll_data = {i_operand_a[30:0], 1'b0};
            5'd2:  o_sll_data = {i_operand_a[29:0], 2'b00};
            5'd3:  o_sll_data = {i_operand_a[28:0], 3'b000};
            5'd4:  o_sll_data = {i_operand_a[27:0], 4'b0000};
            5'd5:  o_sll_data = {i_operand_a[26:0], 5'b00000};
            5'd6:  o_sll_data = {i_operand_a[25:0], 6'b000000};
            5'd7:  o_sll_data = {i_operand_a[24:0], 7'b0000000};
            5'd8:  o_sll_data = {i_operand_a[23:0], 8'b00000000};
            5'd9:  o_sll_data = {i_operand_a[22:0], 9'b000000000};
            5'd10: o_sll_data = {i_operand_a[21:0], 10'b0000000000};
            5'd11: o_sll_data = {i_operand_a[20:0], 11'b00000000000};
            5'd12: o_sll_data = {i_operand_a[19:0], 12'b000000000000};
            5'd13: o_sll_data = {i_operand_a[18:0], 13'b0000000000000};
            5'd14: o_sll_data = {i_operand_a[17:0], 14'b00000000000000};
            5'd15: o_sll_data = {i_operand_a[16:0], 15'b000000000000000};
            5'd16: o_sll_data = {i_operand_a[15:0], 16'b0000000000000000};
            5'd17: o_sll_data = {i_operand_a[14:0], 17'b00000000000000000};
            5'd18: o_sll_data = {i_operand_a[13:0], 18'b000000000000000000};
            5'd19: o_sll_data = {i_operand_a[12:0], 19'b0000000000000000000};
            5'd20: o_sll_data = {i_operand_a[11:0], 20'b00000000000000000000};
            5'd21: o_sll_data = {i_operand_a[10:0], 21'b000000000000000000000};
            5'd22: o_sll_data = {i_operand_a[9:0], 22'b0000000000000000000000};
            5'd23: o_sll_data = {i_operand_a[8:0], 23'b00000000000000000000000};
            5'd24: o_sll_data = {i_operand_a[7:0], 24'b000000000000000000000000};
            5'd25: o_sll_data = {i_operand_a[6:0], 25'b0000000000000000000000000};
            5'd26: o_sll_data = {i_operand_a[5:0], 26'b00000000000000000000000000};
            5'd27: o_sll_data = {i_operand_a[4:0], 27'b000000000000000000000000000};
            5'd28: o_sll_data = {i_operand_a[3:0], 28'b0000000000000000000000000000};
            5'd29: o_sll_data = {i_operand_a[2:0], 29'b00000000000000000000000000000};
            5'd30: o_sll_data = {i_operand_a[1:0], 30'b000000000000000000000000000000};
            5'd31: o_sll_data = {i_operand_a[0],  31'b0000000000000000000000000000000};
            default: o_sll_data = i_operand_a;
        endcase
    end

endmodule
