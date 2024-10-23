    .section .text
    .globl _start

_start:
    li   x20, 3 # HEX 0
    li   x2, 0x8020  # Address for first HEX, each HEX add 1
    mv   x10, x20
    jal  ra, seven_seg_decode

    sb   x12, 0(x2) # HEX 0

    li   x2, 0
    li   x8, 0x8810
    li   x3, 0x8000
    
#----------------------------Pressed = 1; Released = 0----------------------------------
P_WAIT: 
    lb   x11, 0(x8)        # Load the value at the address 0x8810 (button status) into x11
    andi x12, x11, 8        # Check if the least significant bit (button status) is set
    bne  x12, x0, P_WAIT   # If button is not pressed (bit is 0), branch back to WAIT

    # sw   x2, 0(x3)
    jal  x1, delay_20ms   # Call the 20ms delay routine

    lb   x11, 0(x8)        # Check the button status again
    andi x12, x11, 8        # Check if the least significant bit is set
    bne  x12, x0, P_WAIT   # If button is released (bit is 0), go back to WAIT

R_WAIT:
    lb   x11, 0(x8)        # Load the value at the address 0x8810 (button status) into x11
    andi x12, x11, 8        # Check if the least significant bit (button status) is set
    beq  x12, x0, R_WAIT   # If button is not pressed (bit is 1), branch back to WAIT

    jal  x1, delay_20ms   # Call the 20ms delay routine

    lb   x11, 0(x8)        # Check the button status again
    andi x12, x11, 8        # Check if the least significant bit is set
    beq  x12, x0, R_WAIT   # If button is still not pressed, go back to WAIT

    addi x2, x2, 1
    sw x2, 0(x3)
    j P_WAIT


delay_20ms:
    li   t0, 249999   #249999    # Load 50 million into t0 (1 second delay for 50 MHz clock)
delay_loop:
    addi t0, t0, -1      # Decrement the counter
    bne  t0, x0, delay_loop  # If t0 is not zero, branch back to delay_loop
    jalr x0,x1,0                  # Return from the function

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
    li      t1, 0x89        # Bit pattern for '1'
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
    li      t1, 0x88        # Bit pattern for '7'
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