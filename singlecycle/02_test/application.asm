    .section .text
    .globl _start

_start:

li x2, 0x7020  # Address for first HEX, each HEX add 1
li x3, 10 # check value
li x4, 10 # check value
li x7, 6 
li x20, 0 # HEX 0
li x21, 1 # HEX 1
li x22, 2 # HEX 2
li x23, 3 # HEX 3
li x24, 4 # HEX 4
li x25, 5 # HEX 5
li x26, 6 # HEX 6
li x27, 7 # HEX 7

mv x10, x20
jal ra, seven_seg_decode
sb x6, 0(x2) # HEX 0

mv x10, x21
jal ra, seven_seg_decode
sb x6, 1(x2) # HEX 1

mv x10, x22
jal ra, seven_seg_decode
sb x6, 2(x2) # HEX 2

mv x10, x23
jal ra, seven_seg_decode
sb x6, 3(x2) # HEX 3

mv x10, x24
jal ra, seven_seg_decode
sb x6, 4(x2) # HEX 4

mv x10, x25
jal ra, seven_seg_decode
sb x6, 5(x2) # HEX 5

mv x10, x26
jal ra, seven_seg_decode
sb x6, 6(x2) # HEX 6

mv x10, x27
jal ra, seven_seg_decode
sb x6, 7(x2) # HEX 7

here:
mv x10, x20
jal ra, seven_seg_decode
sb x6, 0(x2)
addi x20, x20, 1
jal ra, delay_10ms
bne x20, x3, here # if pass 9

addi x20, x0, 0
mv x10, x20
jal ra, seven_seg_decode
sb x6, 0(x2)
addi x21, x21, 1
mv x10, x21
jal ra, seven_seg_decode
sb x6, 1(x2)
bne x4, x21, here

addi x21, x0, 0
mv x10, x21
jal ra, seven_seg_decode
sb x6, 1(x2)
addi x22, x22, 1
mv x10, x22
jal ra, seven_seg_decode
sb x6, 2(x2)
bne x4, x22, here

addi x22, x0, 0
mv x10, x22
jal ra, seven_seg_decode
sb x6, 2(x2)
addi x23, x23, 1
mv x10, x23
jal ra, seven_seg_decode
sb x6, 3(x2)
bne x7, x23, here

addi x23, x0, 0
mv x10, x23
jal ra, seven_seg_decode
sb x6, 3(x2)
addi x24, x24, 1
mv x10, x24
jal ra, seven_seg_decode
sb x6, 4(x2)
bne x4, x24, here

addi x24, x0, 0
mv x10, x24
jal ra, seven_seg_decode
sb x6, 4(x2)
addi x25, x25, 1
mv x10, x25
jal ra, seven_seg_decode
sb x6, 5(x2)
bne x7, x25, here

addi x25, x0, 0
mv x10, x25
jal ra, seven_seg_decode
sb x6, 5(x2)
addi x26, x26, 1
mv x10, x26
jal ra, seven_seg_decode
sb x6, 6(x2)
bne x4, x26, here

addi x26, x0, 0
mv x10, x26
jal ra, seven_seg_decode
sb x6, 6(x2)
addi x27, x27, 1
mv x10, x27
jal ra, seven_seg_decode
sb x6, 7(x2)
bne x4, x27, here

addi x27, x0, 0
mv x10, x27
jal ra, seven_seg_decode
sb x6, 7(x2)
j here

# Function: seven_seg_decode (exclude x10, x5, x6)
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
    li      t1, 0x40        # Bit pattern for '0'
    jr ra

display_1:
    li      t1, 0x79        # Bit pattern for '1'
    jr ra

display_2:
    li      t1, 0x24        # Bit pattern for '2'
    jr ra

display_3:
    li      t1, 0x30        # Bit pattern for '3'
    jr ra

display_4:
    li      t1, 0x19        # Bit pattern for '4'
    jr ra

display_5:
    li      t1, 0x12        # Bit pattern for '5'
    jr ra

display_6:
    li      t1, 0x02        # Bit pattern for '6'
    jr ra

display_7:
    li      t1, 0x78        # Bit pattern for '7'
    jr ra

display_8:
    li      t1, 0x00        # Bit pattern for '8'
    jr ra

display_9:
    li      t1, 0x10        # Bit pattern for '9'
    jr ra

display_A:
    li      t1, 0x08        # Bit pattern for 'A'
    jr ra

display_B:
    li      t1, 0x03        # Bit pattern for 'B'
    jr ra

display_C:
    li      t1, 0x46        # Bit pattern for 'C'
    jr ra

display_D:
    li      t1, 0x21        # Bit pattern for 'D'
    jr ra

display_E:
    li      t1, 0x06        # Bit pattern for 'E'
    jr ra

display_F:
    li      t1, 0x0e        # Bit pattern for 'F'
    jr ra

delay_10ms:
    li t0, 1250000   # Load 50 million into t0 (1 second delay for 50 MHz clock)
delay_loop:
    addi t0, t0, -1      # Decrement the counter
    bne t0, x0, delay_loop  # If t0 is not zero, branch back to delay_loop
    jalr x0,x1,0                  # Return from the function