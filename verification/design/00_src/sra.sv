module sra (
    input  [31:0] i_operand_a, 
    input  [31:0] i_operand_b,
    output reg [31:0] o_sra_data
);

    always @(*) begin
        case (i_operand_b[4:0])
            5'd0:  o_sra_data = i_operand_a;
            5'd1:  o_sra_data = {{1{i_operand_a[31]}}, i_operand_a[31:1]};
            5'd2:  o_sra_data = {{2{i_operand_a[31]}}, i_operand_a[31:2]};
            5'd3:  o_sra_data = {{3{i_operand_a[31]}}, i_operand_a[31:3]};
            5'd4:  o_sra_data = {{4{i_operand_a[31]}}, i_operand_a[31:4]};
            5'd5:  o_sra_data = {{5{i_operand_a[31]}}, i_operand_a[31:5]};
            5'd6:  o_sra_data = {{6{i_operand_a[31]}}, i_operand_a[31:6]};
            5'd7:  o_sra_data = {{7{i_operand_a[31]}}, i_operand_a[31:7]};
            5'd8:  o_sra_data = {{8{i_operand_a[31]}}, i_operand_a[31:8]};
            5'd9:  o_sra_data = {{9{i_operand_a[31]}}, i_operand_a[31:9]};
            5'd10: o_sra_data = {{10{i_operand_a[31]}}, i_operand_a[31:10]};
            5'd11: o_sra_data = {{11{i_operand_a[31]}}, i_operand_a[31:11]};
            5'd12: o_sra_data = {{12{i_operand_a[31]}}, i_operand_a[31:12]};
            5'd13: o_sra_data = {{13{i_operand_a[31]}}, i_operand_a[31:13]};
            5'd14: o_sra_data = {{14{i_operand_a[31]}}, i_operand_a[31:14]};
            5'd15: o_sra_data = {{15{i_operand_a[31]}}, i_operand_a[31:15]};
            5'd16: o_sra_data = {{16{i_operand_a[31]}}, i_operand_a[31:16]};
            5'd17: o_sra_data = {{17{i_operand_a[31]}}, i_operand_a[31:17]};
            5'd18: o_sra_data = {{18{i_operand_a[31]}}, i_operand_a[31:18]};
            5'd19: o_sra_data = {{19{i_operand_a[31]}}, i_operand_a[31:19]};
            5'd20: o_sra_data = {{20{i_operand_a[31]}}, i_operand_a[31:20]};
            5'd21: o_sra_data = {{21{i_operand_a[31]}}, i_operand_a[31:21]};
            5'd22: o_sra_data = {{22{i_operand_a[31]}}, i_operand_a[31:22]};
            5'd23: o_sra_data = {{23{i_operand_a[31]}}, i_operand_a[31:23]};
            5'd24: o_sra_data = {{24{i_operand_a[31]}}, i_operand_a[31:24]};
            5'd25: o_sra_data = {{25{i_operand_a[31]}}, i_operand_a[31:25]};
            5'd26: o_sra_data = {{26{i_operand_a[31]}}, i_operand_a[31:26]};
            5'd27: o_sra_data = {{27{i_operand_a[31]}}, i_operand_a[31:27]};
            5'd28: o_sra_data = {{28{i_operand_a[31]}}, i_operand_a[31:28]};
            5'd29: o_sra_data = {{29{i_operand_a[31]}}, i_operand_a[31:29]};
            5'd30: o_sra_data = {{30{i_operand_a[31]}}, i_operand_a[31:30]};
            5'd31: o_sra_data = {{31{i_operand_a[31]}}, i_operand_a[31]};
            default: o_sra_data = i_operand_a;
        endcase
    end

endmodule
