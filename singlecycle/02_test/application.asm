    .section .text
    .globl _start

_start:

    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
#---------------------------------------------------------------------------
# Using x2 x3 x4 x5 x6 x7
power_reset_lcd:

    li   x2, 0x7030          # Address of LCD
    li   x3, 0xC0000000      # Turn on LCD and Backlight
    sw   x3, 0(x2)
    li   x3, 124999          # Delay 20ms
    jal  x1, delay

    li   x4, 0               # Write command RS = 0
    li   x3, 0x30            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 26249           # Delay 4.2ms
    jal  x1, delay

    li   x4, 0               # Write command RS = 0
    li   x3, 0x30            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 12499           # Delay 200us
    jal  x1, delay

    li   x4, 0               # Write command RS = 0
    li   x3, 0x30            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 12499           # Delay 200us
    jal  x1, delay

#---------------------------------------------------------------------------
# Using x2 x3 x4 x5 x6 x7
init_lcd:

    li   x4, 0               # Write command RS = 0
    li   x3, 0x38            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 0               # Write command RS = 0
    li   x3, 0x01            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 12499           # Delay 2ms
    jal  x1, delay

    li   x4, 0               # Write command RS = 0
    li   x3, 0x0C            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 0               # Write command RS = 0
    li   x3, 0x06            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 0               # Write command RS = 0
    li   x3, 0x82            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    j    init_prog

#---------------------------------------------------------------------------
# Using x2 x3 x7 x30
# Input x3 = 8-bit command/data; x30 = RS ( Command = 0, Data = 1 )
out_lcd:
    addi x7, x1, 0           # Save return address
    li   x2, 0x7030          # Address of LCD
    beq  x30, x0, command     # If RS = 0
    addi x3, x3, 1536        # ( RS = 1; EN = 1 ) + Data
    j    send
command:
    addi x3, x3, 1024        # ( RS = 0; EN = 1 ) + Command
send:
    sh   x3, 0(x2)
    li   x3, 624             # Delay 100us
    jal  x1, delay
    sh   x0, 1(x2)           # Pull EN to low for LCD starts executing
    addi x1, x7, 0           # Restore return address
    li   x3, 10
    li   x4, 10
    li   x7, 6
    li   x2, 0x7020
    jalr x0,x1,0             # Return from the function
#---------------------------------------------------------------------
lap:
    mv   x14, ra
P_WAIT1: 
    lb   x11, 0(x8)         # Load the value at the address 0x8810 (button status) into x11
    andi x12, x11, 4        # Check if the least significant bit (button status) is set
    bne  x12, x0, P_WAIT1   # If button is not pressed (bit is 0), branch back to WAIT

    # sw   x2, 0(x3)
    jal  x1, delay_10ms     # Call the 20ms delay routine
    jal  x1, delay_10ms     # Call the 20ms delay routine

    lb   x11, 0(x8)         # Check the button status again
    andi x12, x11, 4        # Check if the least significant bit is set
    bne  x12, x0, P_WAIT1   # If button is released (bit is 0), go back to WAIT

R_WAIT1:
    lb   x11, 0(x8)         # Load the value at the address 0x8810 (button status) into x11
    andi x12, x11, 4        # Check if the least significant bit (button status) is set
    beq  x12, x0, R_WAIT1   # If button is not pressed (bit is 1), branch back to WAIT

    jal  x1, delay_10ms     # Call the 20ms delay routine
    jal  x1, delay_10ms     # Call the 20ms delay routine

    lb   x11, 0(x8)         # Check the button status again
    andi x12, x11, 4        # Check if the least significant bit is set
    beq  x12, x0, R_WAIT1   # If button is still not pressed, go back to WAIT

    li   x30, 1
    mv   x3, x29            # Data content
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    mv   x3, x28            # Data content
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    li   x3, 58             # Data content :
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    mv   x3, x19            # Data content
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    mv   x3, x18            # Data content
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    li   x3, 58             # Data content :
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    mv   x3, x17            # Data content
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    mv   x3, x16            # Data content
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    li   x3, 58             # Data content :
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    mv   x3, x15            # Data content
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay
    
    li   x30, 1
    mv   x3, x9             # Data content
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay

    bne  x31, x0, row2
    li   x3, 0x82           # Command content
    li   x31, 1
    j    movecur
row2:
    li   x3, 0xC2           # Command content
    li   x31, 0
movecur:
    li   x30, 0
    jal  x1, out_lcd        # Write to LCD
    li   x3, 624            # Delay 100us
    jal  x1, delay

    jalr x0, x14, 0
#--------------------------------------------------------------------
init_prog:
    li x3,  10 # check value
    li x4,  10 # check value
    li x7,  6 
    li x20, 0  # HEX 0
    li x21, 0  # HEX 1
    li x22, 0  # HEX 2
    li x23, 0  # HEX 3
    li x24, 0  # HEX 4
    li x25, 0  # HEX 5
    li x26, 0  # HEX 6
    li x27, 0  # HEX 7
    li x9,  48
    li x15, 48
    li x16, 48
    li x17, 48
    li x18, 48
    li x19, 48
    li x28, 48
    li x29, 48
    li x31, 1  # Cursor flag
    
    li   x2, 0x7020  # Address for first HEX, each HEX add 1
    li   x8, 0x7810  # Address of Buttons

    mv   x10, x20
    jal  ra, seven_seg_decode
    sb   x6, 0(x2) # HEX 0

    mv   x10, x21
    jal  ra, seven_seg_decode
    sb   x6, 1(x2) # HEX 1

    mv   x10, x22
    jal  ra, seven_seg_decode
    sb   x6, 2(x2) # HEX 2

    mv   x10, x23
    jal  ra, seven_seg_decode
    sb   x6, 3(x2) # HEX 3

    mv   x10, x24
    jal  ra, seven_seg_decode
    sb   x6, 4(x2) # HEX 4

    mv   x10, x25
    jal  ra, seven_seg_decode
    sb   x6, 5(x2) # HEX 5

    mv   x10, x26
    jal  ra, seven_seg_decode
    sb   x6, 6(x2) # HEX 6

    mv   x10, x27
    jal  ra, seven_seg_decode
    sb   x6, 7(x2) # HEX 7

    jal  x14, init_start

here:
    lb   x11, 0(x8)         # Load the value at the address 0x7810 (button status) into x5
    andi x12, x11, 8        # Check if the least significant bit (button status) is set
    bne  x12, x0, check1
    jal  ra, stop

check1:
    lb   x11, 0(x8)         # Load the value at the address 0x7810 (button status) into x5
    andi x12, x11, 4        # Check if the least significant bit (button status) is set
    bne  x12, x0, skip
    jal  ra , lap

skip:
    mv   x10, x20           # Digit 0
    addi x9, x20, 48
    jal  ra, seven_seg_decode

    # li x31, 0x7000
    # sw x3, 0(x31)
    sb   x6,  0(x2)
    addi x20, x20, 1
    jal  ra,  delay_10ms
    bne  x20, x3, here      # if pass 9

    addi x20, x0, 0
    mv   x10, x20           # Digit 0 reset
    addi x9,  x20, 48
    jal  ra,  seven_seg_decode
    sb   x6,  0(x2)
    addi x21, x21, 1
    mv   x10, x21            # Digit 1
    addi x15, x21, 48
    jal  ra,  seven_seg_decode
    sb   x6,  1(x2)
    bne  x4,  x21, here

    addi x21, x0, 0
    mv   x10, x21            # Digit 1 reset
    addi x15, x21, 48
    jal  ra,  seven_seg_decode
    sb   x6,  1(x2)
    addi x22, x22, 1
    mv   x10, x22            # Digit 2
    addi x16, x22, 48
    jal  ra,  seven_seg_decode
    sb   x6,  2(x2)
    bne  x4,  x22, here

    addi x22, x0, 0
    mv   x10, x22            # Digit 2 reset
    addi x16, x22, 48
    jal  ra,  seven_seg_decode
    sb   x6,  2(x2)
    addi x23, x23, 1
    mv   x10, x23            # Digit 3
    addi x17, x23, 48
    jal  ra,  seven_seg_decode
    sb   x6,  3(x2)
    bne  x7,  x23, here

    addi x23, x0, 0
    mv   x10, x23            # Digit 3 reset
    addi x17, x23, 48
    jal  ra, seven_seg_decode
    sb   x6, 3(x2)
    addi x24, x24, 1
    mv   x10, x24            # Digit 4
    addi x18, x24, 48
    jal  ra, seven_seg_decode
    sb   x6, 4(x2)
    bne  x4, x24, here

    addi x24, x0, 0
    mv   x10, x24            # Digit 4 reset
    addi x18, x24, 48
    jal  ra,  seven_seg_decode
    sb   x6,  4(x2)
    addi x25, x25, 1
    mv   x10, x25            # Digit 5
    addi x19, x25, 48
    jal  ra,  seven_seg_decode
    sb   x6,  5(x2)
    bne  x7,  x25, here

    addi x25, x0, 0
    mv   x10, x25            # Digit 5 reset
    addi x19, x25, 48
    jal  ra, seven_seg_decode
    sb   x6, 5(x2)
    addi x26, x26, 1
    mv   x10, x26            # Digit 6
    addi x28, x26, 48
    jal  ra, seven_seg_decode
    sb   x6, 6(x2)
    bne  x4, x26, here

    addi x26, x0, 0
    mv   x10, x26            # Digit 6 reset
    addi x28, x26, 48
    jal  ra, seven_seg_decode
    sb   x6, 6(x2)
    addi x27, x27, 1
    mv   x10, x27            # Digit 7
    addi x29, x27, 48
    jal  ra, seven_seg_decode
    sb   x6, 7(x2)
    bne  x4, x27, here

    addi x27, x0, 0
    mv   x10, x27
    addi x29, x27, 48        # Digit 7 reset
    jal  ra, seven_seg_decode
    sb   x6, 7(x2)
    j    here
#------------------------------------------------------------------------------------------
stop:
    mv   x14, x1
    li   x13, 0
P_WAIT: 
    lb   x11, 0(x8)         # Load the value at the address 0x8810 (button status) into x11
    andi x12, x11, 2        # Check if the button 1 is pressed
    bne  x12, x0, cont
    jal  ra , reset
cont:
    andi x12, x11, 8        # Check if the button 3 is pressed
    bne  x12, x0, P_WAIT    # If button is not pressed (bit is 0), branch back to WAIT

    # sw   x2, 0(x3)
    jal  x1, delay_10ms     # Call the 20ms delay routine
    jal  x1, delay_10ms     # Call the 20ms delay routine

    lb   x11, 0(x8)         # Check the button status again
    andi x12, x11, 8        # Check if the least significant bit is set
    bne  x12, x0, P_WAIT    # If button is released (bit is 0), go back to WAIT

R_WAIT:
    lb   x11, 0(x8)         # Load the value at the address 0x8810 (button status) into x11
    andi x12, x11, 8        # Check if the least significant bit (button status) is set
    beq  x12, x0, R_WAIT    # If button is not pressed (bit is 1), branch back to WAIT

    jal  x1, delay_10ms     # Call the 20ms delay routine
    jal  x1, delay_10ms     # Call the 20ms delay routine

    lb   x11, 0(x8)         # Check the button status again
    andi x12, x11, 8        # Check if the least significant bit is set
    beq  x12, x0, R_WAIT    # If button is still not pressed, go back to WAIT

init_start:
    bne  x13, x0, run
    addi x13, x13, 1
    j    P_WAIT
run:
    jalr x0, x14, 0
#------------------------------------------------------------------------------------------
reset:
    li   x2, 0x2100
    sw   x1, 0(x2)
P_WAIT2: 
    lb   x11, 0(x8)         # Load the value at the address 0x8810 (button status) into x11
    andi x12, x11, 2        # Check if the least significant bit (button status) is set
    bne  x12, x0, P_WAIT2   # If button is not pressed (bit is 0), branch back to WAIT

    # sw   x2, 0(x3)
    jal  x1, delay_10ms     # Call the 20ms delay routine
    jal  x1, delay_10ms     # Call the 20ms delay routine

    lb   x11, 0(x8)         # Check the button status again
    andi x12, x11, 2        # Check if the least significant bit is set
    bne  x12, x0, P_WAIT2   # If button is released (bit is 0), go back to WAIT

R_WAIT2:
    lb   x11, 0(x8)         # Load the value at the address 0x8810 (button status) into x11
    andi x12, x11, 2        # Check if the least significant bit (button status) is set
    beq  x12, x0, R_WAIT2   # If button is not pressed (bit is 1), branch back to WAIT

    jal  x1, delay_10ms     # Call the 20ms delay routine
    jal  x1, delay_10ms     # Call the 20ms delay routine

    lb   x11, 0(x8)         # Check the button status again
    andi x12, x11, 2        # Check if the least significant bit is set
    beq  x12, x0, R_WAIT2   # If button is still not pressed, go back to WAIT

    li x20, 0  # HEX 0
    li x21, 0  # HEX 1
    li x22, 0  # HEX 2
    li x23, 0  # HEX 3
    li x24, 0  # HEX 4
    li x25, 0  # HEX 5
    li x26, 0  # HEX 6
    li x27, 0  # HEX 7

    li   x2, 0x7020
    mv   x10, x20
    jal  ra, seven_seg_decode
    sb   x6, 0(x2) # HEX 0

    mv   x10, x21
    jal  ra, seven_seg_decode
    sb   x6, 1(x2) # HEX 1

    mv   x10, x22
    jal  ra, seven_seg_decode
    sb   x6, 2(x2) # HEX 2

    mv   x10, x23
    jal  ra, seven_seg_decode
    sb   x6, 3(x2) # HEX 3

    mv   x10, x24
    jal  ra, seven_seg_decode
    sb   x6, 4(x2) # HEX 4

    mv   x10, x25
    jal  ra, seven_seg_decode
    sb   x6, 5(x2) # HEX 5

    mv   x10, x26
    jal  ra, seven_seg_decode
    sb   x6, 6(x2) # HEX 6

    mv   x10, x27
    jal  ra, seven_seg_decode
    sb   x6, 7(x2) # HEX 7

    li   x4, 0               # Write command RS = 0
    li   x3, 0x01            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 12499           # Delay 2ms
    jal  x1, delay

    li   x4, 0               # Write command RS = 0
    li   x3, 0x82            # Command content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li x9,  48
    li x15, 48
    li x16, 48
    li x17, 48
    li x18, 48
    li x19, 48
    li x28, 48
    li x29, 48
    li x31, 1  # Cursor flag

    li   x2, 0x2100
    lw   x1, 0(x2)
    li   x2, 0x7020
    jalr x0, x1, 0
#------------------------------------------------------------------------------------------
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

#---------------------------------------------------------------------------
# Using x3 x5
# CLOCK = 12 500 000Hz
delay:
    # 20ms  = 124 999
    # 4.2ms =  26 249
    # 2ms   =  12 499
    # 200us =   1 249
    # 100us =     624
    add  x5, x0, x3
dloop:
    addi x5, x5, -1          # Decrement the counter
    bne  x5, x0, dloop       # If t0 is not zero, branch back to delay_loop
    li   x3, 10
    jalr x0,x1,0             # Return from the function
#--------------------------------------------------------------------------------
# CLOCK = 12 500 000Hz
delay_10ms:
    li   t0, 62500          
delay_loop:
    addi t0, t0, -1          # Decrement the counter
    bne  t0, x0, delay_loop  # If t0 is not zero, branch back to delay_loop
    jalr x0, x1, 0           # Return from the function