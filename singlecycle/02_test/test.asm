    .section .text
    .globl _start

_start:

li x2, 0x7020
li x11, 16

here:
addi x10,x10,1
bne x11, x10, skip
addi x10,x0,0
skip:
jal x1, seven_seg_decode
sw x6,0(x2)
jal x1, delay_1s
j here

# Function: seven_seg_decode
# Input: a0 - Input value (0 to 15)
# Output: Writes the corresponding bit pattern to a memory-mapped I/O register (0x10000000)
seven_seg_decode:
    # Check if a0 contains a valid value (0-F)
    li      t0, 0           # Load immediate 0 into t0 for comparison
    beq     a0, t0, display_0

    li      t0, 1           # Check for 1
    beq     a0, t0, display_1

    li      t0, 2           # Check for 2
    beq     a0, t0, display_2

    li      t0, 3           # Check for 3
    beq     a0, t0, display_3

    li      t0, 4           # Check for 4
    beq     a0, t0, display_4

    li      t0, 5           # Check for 5
    beq     a0, t0, display_5

    li      t0, 6           # Check for 6
    beq     a0, t0, display_6

    li      t0, 7           # Check for 7
    beq     a0, t0, display_7

    li      t0, 8           # Check for 8
    beq     a0, t0, display_8

    li      t0, 9           # Check for 9
    beq     a0, t0, display_9

    li      t0, 10          # Check for A (10 in decimal)
    beq     a0, t0, display_A

    li      t0, 11          # Check for B (11 in decimal)
    beq     a0, t0, display_B

    li      t0, 12          # Check for C (12 in decimal)
    beq     a0, t0, display_C

    li      t0, 13          # Check for D (13 in decimal)
    beq     a0, t0, display_D

    li      t0, 14          # Check for E (14 in decimal)
    beq     a0, t0, display_E

    li      t0, 15          # Check for F (15 in decimal)
    beq     a0, t0, display_F
    
    # If input is out of range, do nothing and return
    jr ra

# Define display patterns for each number (0-F)
display_0:
    li      t1, 0x81        # Bit pattern for '0'
    jr ra

display_1:
    li      t1, 0x4F        # Bit pattern for '1'
    jr ra

display_2:
    li      t1, 0x12        # Bit pattern for '2'
    jr ra

display_3:
    li      t1, 0x06        # Bit pattern for '3'
    jr ra

display_4:
    li      t1, 0x4C        # Bit pattern for '4'
    jr ra

display_5:
    li      t1, 0x24        # Bit pattern for '5'
    jr ra

display_6:
    li      t1, 0x20        # Bit pattern for '6'
    jr ra

display_7:
    li      t1, 0x0F        # Bit pattern for '7'
    jr ra

display_8:
    li      t1, 0x00        # Bit pattern for '8'
    jr ra

display_9:
    li      t1, 0x04        # Bit pattern for '9'
    jr ra

display_A:
    li      t1, 0x88        # Bit pattern for 'A'
    jr ra

display_B:
    li      t1, 0x60        # Bit pattern for 'B'
    jr ra

display_C:
    li      t1, 0x31        # Bit pattern for 'C'
    jr ra

display_D:
    li      t1, 0x42        # Bit pattern for 'D'
    jr ra

display_E:
    li      t1, 0x30        # Bit pattern for 'E'
    jr ra

display_F:
    li      t1, 0x38        # Bit pattern for 'F'
    jr ra

# li x4, 0x7000
# li x2, 0xAAAAAAAA
# li x3, 0x55555555
# here:
# mv x6,x2
# sw x6, 0(x4)
# jal x1, delay_1s
# mv x6,x3
# sw x6, 0(x4)
# jal x1, delay_1s
# j here

delay_1s:
    li t0, 25000000    # Load 50 million into t0 (1 second delay for 50 MHz clock)
delay_loop:
    addi t0, t0, -1      # Decrement the counter
    bne t0, x0, delay_loop  # If t0 is not zero, branch back to delay_loop
    jalr x0,x1,0                  # Return from the function

#     # Initialize registers with known values
#     li x1, 0x0000000F  # 15
#     li x2, 0xFFFFFFF1  # -15 (two's complement)
#     li x3, 0x00000010  # 16
#     li x4, 0x000000FF  # 255
#     li x5, 0x7FFFFFFF  # Largest signed positive 32-bit value
#     li x6, 0x80000000  # Smallest signed negative 32-bit value

#     #####################################
#     # ALU Tests: Signed and Unsigned
#     #####################################

#     # ADD (Signed Addition)
#     add x7, x1, x3          # x7 = 15 + 16 = 31
#     add x8, x2, x4          # x8 = -15 + 255 = 240

#     # ADDU (Unsigned Addition - treated similarly in RV32I)
#     add x9, x5, x6         # x9 = 0x7FFFFFFF + 0x80000000 (Unsigned wraparound)

#     # SUB (Signed Subtraction)
#     sub x10, x3, x1         # x10 = 16 - 15 = 1
#     sub x11, x4, x2         # x11 = 255 - (-15) = 270

#     # AND (Bitwise AND)
#     andi x12, x1, 0xFF         # x12 = 0x0F & 0xFF = 0x0F

#     # OR (Bitwise OR)
#     ori x13, x1, 0xFF         # x13 = 0x0F | 0xFF = 0xFF

#     # XOR (Bitwise XOR)
#     xori x14, x1, 0xFF         # x14 = 0x0F ^ 0xFF = 0xF0

#     # SLT (Set less than, signed)
#     slti x15, x1, 16         # x15 = (15 < 16) = 1
#     slti x16, x3, 15         # x16 = (16 < 15) = 0
#     slti x16, x3, -1         # x16 = (16 < -1) = 0
#     li x3, -2
#     slti x16, x3, -1         # x16 = (-2 < -1) = 1

#     # SLTU (Set less than, unsigned)
#     sltiu x17, x1, 16        # x17 = (15 < 16) = 1
#     li x5, 1
#     sltiu x18, x5, -2048       # x18 = (1 < 2048) = 1 (unsigned comparison)

#     li x1, 0x10101010
#     li x30, 0xC00FFEEE
#     # Illegal instruction
#     mul x30, x2, x3 
    

#     #####################################
#     # Branch and Jump Instructions
#     #####################################

#     # BEQ (Branch if Equal)
#     beq x1, x1, label_eq    # Should branch (15 == 15)
#     li x31, 0xDEADBEE1      # Should be skipped
# label_eq:
#     li x20, 0x7FFFFFFF      # Data 
#     li x21, 0x00002000      # Data Memory Address 
#     sw x20, 0(x21)

#     li x20, 0x0000AAAA
#     sh x20, 4(x21)
#     sb x20, 8(x21)

#     li x20, 0x7770FFFF      # 16bit & 8bit negative
#     sw x20, 12(x21)
#     lw x22, 12(x21)         # Load halfword
#     lh x23, 12(x21)
#     lb x24, 12(x21)

#     li x20, 0x1111AAAA
#     sw x20, 16(x21)
#     lhu x25, 16(x21)
#     lbu x26, 16(x21) 

#     li x21, 0x00007000
#     li x20, 0xA0A0A0A0
#     sw x20, 0(x21)
#     sh x20, 8(x21)
#     sb x20, 16(x21)

#     li x21, 0x00007020       # Drive HEX0
#     li x20, 0xA0A0A0A0
#     sb x20, 0(x21)

#     li x21, 0x00007020       # Drive HEX1
#     li x20, 0x0000007C
#     sb x20, 1(x21)

#     li x21, 0x00007020       # Drive HEX2
#     li x20, 0xA0A0005E
#     sb x20, 2(x21)

#     li x21, 0x00007020       # Drive HEX3
#     li x20, 0x1234008B
#     sb x20, 3(x21)


#     sb x20, 18(x21)

#     li x31, 0x0C0FFEE1      # Target of BEQ

#     # BNE (Branch if Not Equal)
#     bne x1, x2, label_ne    # Should branch (15 != -15)
#     li x31, 0xDEADBEE2      # Should be skipped
# label_ne:
#     li x31, 0x0C0FFEE2                     # Target of BNE

#     # BLT (Branch if Less Than, signed)
#     blt x1, x3, label_lt    # Should branch (15 < 16)
#     li x31, 0xDEADBEE3      # Should be skipped
# label_lt:
#     li x31, 0x0C0FFEE3                     # Target of BLT

#     # BGE (Branch if Greater or Equal, signed)
#     bge x3, x1, label_ge    # Should branch (16 >= 15)
#     li x31, 0xDEADBEE4      # Should be skipped
# label_ge:
#     li x31, 0x0C0FFEE4                     # Target of BGE

#     # JAL (Jump and Link)
#     jal x30, label_jump     # Jump to label_jump, save return address in x30
#     li x31, 0xDEADBEE5      # Should be skipped
# label_jump:
#     li x31, 0x0C0FFEE5                     # Target of JAL

#     # JALR (Jump and Link Register)
#     auipc x2, 0
#     addi x2, x2, 20
#     jalr x30, x2, 0         # Jump to the address in x1 (which contains 15), save return address in x30
#     li x31, 0xDEADBEE6      # Should be skipped

#     # End of test
#     j end_of_test



# j _start
# end_of_test:
#     j end_of_test

