    .section .text
    .globl _start

_start:

    # Initialize registers with known values
    li x1, 0x0000000F  # 15
    li x2, 0xFFFFFFF1  # -15 (two's complement)
    li x3, 0x00000010  # 16
    li x4, 0x000000FF  # 255
    li x5, 0x7FFFFFFF  # Largest signed positive 32-bit value
    li x6, 0x80000000  # Smallest signed negative 32-bit value

    #####################################
    # ALU Tests: Signed and Unsigned
    #####################################

    # ADD (Signed Addition)
    add x7, x1, x3          # x7 = 15 + 16 = 31
    add x8, x2, x4          # x8 = -15 + 255 = 240

    # ADDU (Unsigned Addition - treated similarly in RV32I)
    add x9, x5, x6         # x9 = 0x7FFFFFFF + 0x80000000 (Unsigned wraparound)

    # SUB (Signed Subtraction)
    sub x10, x3, x1         # x10 = 16 - 15 = 1
    sub x11, x4, x2         # x11 = 255 - (-15) = 270

    # AND (Bitwise AND)
    andi x12, x1, 0xFF         # x12 = 0x0F & 0xFF = 0x0F

    # OR (Bitwise OR)
    ori x13, x1, 0xFF         # x13 = 0x0F | 0xFF = 0xFF

    # XOR (Bitwise XOR)
    xori x14, x1, 0xFF         # x14 = 0x0F ^ 0xFF = 0xF0

    # SLT (Set less than, signed)
    slti x15, x1, 16         # x15 = (15 < 16) = 1
    slti x16, x3, 15         # x16 = (16 < 15) = 0
    slti x16, x3, -1         # x16 = (16 < -1) = 0
    li x3, -2
    slti x16, x3, -1         # x16 = (-2 < -1) = 1

    # SLTU (Set less than, unsigned)
    sltiu x17, x1, 16        # x17 = (15 < 16) = 1
    li x5, 1
    sltiu x18, x5, -2048       # x18 = (1 < 2048) = 1 (unsigned comparison)

    #####################################
    # Branch and Jump Instructions
    #####################################

    # BEQ (Branch if Equal)
    beq x1, x1, label_eq    # Should branch (15 == 15)
    li x31, 0xDEADBEE1      # Should be skipped
label_eq:
    li x20, 0x7FFFFFFF      # Data 
    li x21, 0x00002000      # Data Memory Address 
    sw x20, 0(x21)

    li x20, 0x0000AAAA
    sh x20, 4(x21)
    sb x20, 8(x21)

    li x20, 0x7770FFFF      # 16bit & 8bit negative
    sw x20, 12(x21)
    lw x22, 12(x21)         # Load halfword
    lh x23, 12(x21)
    lb x24, 12(x21)

    li x20, 0x1111AAAA
    sw x20, 16(x21)
    lhu x25, 16(x21)
    lbu x26, 16(x21) 

    li x21, 0x00007000
    li x20, 0xA0A0A0A0
    sw x20, 0(x21)
    sh x20, 8(x21)
    sb x20, 16(x21)

    li x21, 0x00007020       # Drive HEX0
    li x20, 0xA0A0A0A0
    sb x20, 0(x21)

    li x21, 0x00007020       # Drive HEX1
    li x20, 0x0000007C
    sb x20, 1(x21)

    li x21, 0x00007020       # Drive HEX2
    li x20, 0xA0A0005E
    sb x20, 2(x21)

    li x21, 0x00007020       # Drive HEX3
    li x20, 0x1234008B
    sb x20, 3(x21)


    sb x20, 18(x21)

    li x31, 0x0C0FFEE1      # Target of BEQ

    # BNE (Branch if Not Equal)
    bne x1, x2, label_ne    # Should branch (15 != -15)
    li x31, 0xDEADBEE2      # Should be skipped
label_ne:
    li x31, 0x0C0FFEE2                     # Target of BNE

    # BLT (Branch if Less Than, signed)
    blt x1, x3, label_lt    # Should branch (15 < 16)
    li x31, 0xDEADBEE3      # Should be skipped
label_lt:
    li x31, 0x0C0FFEE3                     # Target of BLT

    # BGE (Branch if Greater or Equal, signed)
    bge x3, x1, label_ge    # Should branch (16 >= 15)
    li x31, 0xDEADBEE4      # Should be skipped
label_ge:
    li x31, 0x0C0FFEE4                     # Target of BGE

    # JAL (Jump and Link)
    jal x30, label_jump     # Jump to label_jump, save return address in x30
    li x31, 0xDEADBEE5      # Should be skipped
label_jump:
    li x31, 0x0C0FFEE5                     # Target of JAL

    # JALR (Jump and Link Register)
    la x1, end_of_test
    jalr x30, x1, 0         # Jump to the address in x1 (which contains 15), save return address in x30
    li x31, 0xDEADBEE6      # Should be skipped

    # End of test
    j end_of_test

end_of_test:
    nop

