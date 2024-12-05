module srl (
    input  [31:0] i_operand_a,
    input  [31:0] i_operand_b,
    output reg [31:0] o_srl_data
);

    always @(*) begin
        case (i_operand_b[4:0])
            5'd0:  o_srl_data = i_operand_a;
            5'd1:  o_srl_data = {1'b0, i_operand_a[31:1]};
            5'd2:  o_srl_data = {2'b00, i_operand_a[31:2]};
            5'd3:  o_srl_data = {3'b000, i_operand_a[31:3]};
            5'd4:  o_srl_data = {4'b0000, i_operand_a[31:4]};
            5'd5:  o_srl_data = {5'b00000, i_operand_a[31:5]};
            5'd6:  o_srl_data = {6'b000000, i_operand_a[31:6]};
            5'd7:  o_srl_data = {7'b0000000, i_operand_a[31:7]};
            5'd8:  o_srl_data = {8'b00000000, i_operand_a[31:8]};
            5'd9:  o_srl_data = {9'b000000000, i_operand_a[31:9]};
            5'd10: o_srl_data = {10'b0000000000, i_operand_a[31:10]};
            5'd11: o_srl_data = {11'b00000000000, i_operand_a[31:11]};
            5'd12: o_srl_data = {12'b000000000000, i_operand_a[31:12]};
            5'd13: o_srl_data = {13'b0000000000000, i_operand_a[31:13]};
            5'd14: o_srl_data = {14'b00000000000000, i_operand_a[31:14]};
            5'd15: o_srl_data = {15'b000000000000000, i_operand_a[31:15]};
            5'd16: o_srl_data = {16'b0000000000000000, i_operand_a[31:16]};
            5'd17: o_srl_data = {17'b00000000000000000, i_operand_a[31:17]};
            5'd18: o_srl_data = {18'b000000000000000000, i_operand_a[31:18]};
            5'd19: o_srl_data = {19'b0000000000000000000, i_operand_a[31:19]};
            5'd20: o_srl_data = {20'b00000000000000000000, i_operand_a[31:20]};
            5'd21: o_srl_data = {21'b000000000000000000000, i_operand_a[31:21]};
            5'd22: o_srl_data = {22'b0000000000000000000000, i_operand_a[31:22]};
            5'd23: o_srl_data = {23'b00000000000000000000000, i_operand_a[31:23]};
            5'd24: o_srl_data = {24'b000000000000000000000000, i_operand_a[31:24]};
            5'd25: o_srl_data = {25'b0000000000000000000000000, i_operand_a[31:25]};
            5'd26: o_srl_data = {26'b00000000000000000000000000, i_operand_a[31:26]};
            5'd27: o_srl_data = {27'b000000000000000000000000000, i_operand_a[31:27]};
            5'd28: o_srl_data = {28'b0000000000000000000000000000, i_operand_a[31:28]};
            5'd29: o_srl_data = {29'b00000000000000000000000000000, i_operand_a[31:29]};
            5'd30: o_srl_data = {30'b000000000000000000000000000000, i_operand_a[31:30]};
            5'd31: o_srl_data = {31'b0000000000000000000000000000000, i_operand_a[31]};
            default: o_srl_data = i_operand_a;
        endcase
    end

endmodule
