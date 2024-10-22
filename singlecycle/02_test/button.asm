    .section .text
    .globl _start

_start:

    add x2, x0, x0
#----------------------------Pressed = 1; Released = 0----------------------------------
P_WAIT: 
    lw x5, 0x7810        # Load the value at the address 0x7810 (button status) into x5
    andi x6, x5, 1       # Check if the least significant bit (button status) is set
    beq x6, x0, P_WAIT     # If button is not pressed (bit is 0), branch back to WAIT

    jal x1, delay_20ms   # Call the 20ms delay routine

    lw x5, 0x7810        # Check the button status again
    andi x6, x5, 1       # Check if the least significant bit is set
    beq x6, x0, P_WAIT     # If button is released (bit is 0), go back to WAIT

R_WAIT:
    lw x5, 0x7810        # Load the value at the address 0x7810 (button status) into x5
    andi x6, x5, 1       # Check if the least significant bit (button status) is set
    bne x6, x0, R_WAIT     # If button is not pressed (bit is 1), branch back to WAIT

    jal x1, delay_20ms   # Call the 20ms delay routine

    lw x5, 0x7810        # Check the button status again
    andi x6, x5, 1       # Check if the least significant bit is set
    bne x6, x0, R_WAIT     # If button is still not pressed, go back to WAIT

    addi x2, x2, 1
    li x3, 0x7000
    sw x2, 0(x3)

    jal P_WAIT


delay_20ms:
    li t0, 249999    # Load 50 million into t0 (1 second delay for 50 MHz clock)
delay_loop:
    addi t0, t0, -1      # Decrement the counter
    bne t0, x0, delay_loop  # If t0 is not zero, branch back to delay_loop
    jalr x0,x1,0                  # Return from the function

