    .text
    .globl _start
_start:

    jal  x1, power_reset_lcd
    jal  x1, init_lcd

    li   x8, 0x7000
    li   x9, 0xFFFFFFFF
    sw   x9, 0(x8)

    li   x4, 1               # Write data RS = 1
    li   x3, 72              # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 101             # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 108             # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 108             # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 111             # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 32              # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 87              # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 111             # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 114             # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 108             # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 100             # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

    li   x4, 1               # Write data RS = 1
    li   x3, 33              # Data content
    jal  x1, out_lcd         # Write to LCD
    li   x3, 624             # Delay 100us
    jal  x1, delay

here:
    j    here

#---------------------------------------------------------------------------
# Using x2 x3 x4 x5 x6 x7
init_lcd:
    addi x6, x1, 0           # Save return address

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

    addi x1, x6, 0           # Restore return address
    jalr x0,x1,0             # Return from the function
#---------------------------------------------------------------------------
# Using x2 x3 x4 x5 x6 x7
power_reset_lcd:
    addi x6, x1, 0           # Save return address

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

    addi x1, x6, 0           # Restore return address
    jalr x0,x1,0             # Return from the function
#---------------------------------------------------------------------------
# Using x2 x3 x4 x7
# Input x3 = 8-bit command/data; x4 = RS ( Command = 0, Data = 1 )
out_lcd:
    addi x7, x1, 0           # Save return address
    li   x2, 0x7030          # Address of LCD
    beq  x4, x0, command     # If RS = 0
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
    jalr x0,x1,0             # Return from the function
#---------------------------------------------------------------------------
# Using x3 x5
#CLOCK = 12 500 000Hz
delay:
    # 20ms  = 124 999
    # 4.2ms =  26 249
    # 2ms   =  12 499
    # 200us =   1 249
    # 100us =     624
    add  x5, x0, x3
delay_loop:
    addi x5, x5, -1          # Decrement the counter
    bne  x5, x0, delay_loop  # If t0 is not zero, branch back to delay_loop
    jalr x0,x1,0             # Return from the function