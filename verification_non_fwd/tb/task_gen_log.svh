import package_decode::*;
task log2file_branch(input integer fd, input [31:0] pc, input [31:0] instr);
    $fdisplay(fd, "core   0: 3 0x%8h (0x%8h)", pc+32'h3000, instr);
endtask


task log2file_load(input integer fd, input [31:0] pc, input [31:0] instr, input [4:0] reg_num, input [31:0] l_data, input [31:0] ls_addr,
                   input [2:0] mem_type, input [2:0] ls_size);
    bit [31:0] mem_offset;
    case (mem_type)
        3'b001: mem_offset = 32'h2000;
        3'b010: mem_offset = 32'h7000;
        3'b100: mem_offset = 32'h7800; 
    endcase
    if (reg_num < 10) begin
        if (ls_size == 3'b001) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d  0x%8h mem 0x%8h", pc+32'h3000, instr, reg_num, l_data, ls_addr+mem_offset);
        else if (ls_size == 3'b001) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d  0x%8h mem 0x%8h", pc+32'h3000, instr, reg_num, l_data, ls_addr+mem_offset);
        else $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d  0x%8h mem 0x%8h", pc+32'h3000, instr, reg_num, l_data, ls_addr+mem_offset);
    end
    else begin
        if (ls_size == 3'b001) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d 0x%8h mem 0x%8h", pc+32'h3000, instr, reg_num, l_data, ls_addr+mem_offset);
        else if (ls_size == 3'b001) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d 0x%8h mem 0x%8h", pc+32'h3000, instr, reg_num, l_data, ls_addr+mem_offset);
        else $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d 0x%8h mem 0x%8h", pc+32'h3000, instr, reg_num, l_data, ls_addr+mem_offset);
    end
endtask

task log2file_store(input integer fd, input [31:0] pc, input [31:0] instr, input [31:0] s_data, input [31:0] ls_addr,
                    input [2:0] mem_type, input [2:0] ls_size);
    bit [31:0] mem_offset;
    case (mem_type)
        3'b001: mem_offset = 32'h2000;
        3'b010: mem_offset = 32'h7000;
        3'b100: mem_offset = 32'h7800; 
    endcase
    if (ls_size == 3'b001) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) mem 0x%8h 0x%8h", pc+32'h3000, instr, ls_addr+mem_offset, s_data);
    else if (ls_size == 3'b010) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) mem 0x%8h 0x%4h", pc+32'h3000, instr, ls_addr+mem_offset, s_data[15:0]);
    else $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) mem 0x%8h 0x%2h", pc+32'h3000, instr, ls_addr+mem_offset, s_data[7:0]);
endtask

task log2file_jump(input integer fd, input [31:0] pc, input [31:0] instr, input [4:0] reg_num, input [31:0] data);
    if (reg_num == 0) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h)", pc+32'h3000, instr);
    else if (reg_num < 10) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d  0x%8h", pc+32'h3000, instr, reg_num, data+32'h3000);
    else $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d 0x%8h", pc+32'h3000, instr, reg_num, data+32'h3000);
endtask

task log2file_default(input integer fd, input [31:0] pc, input [31:0] instr, input [4:0] reg_num, input [31:0] data);
    if (reg_num == 0) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h)", pc+32'h3000, instr);
    else if (reg_num < 10) $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d  0x%8h", pc+32'h3000, instr, reg_num, data);
    else $fdisplay(fd, "core   0: 3 0x%8h (0x%8h) x%0d 0x%8h", pc+32'h3000, instr, reg_num, data);
endtask