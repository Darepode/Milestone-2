    .section .text
    .globl _start

_start:
    li x3, 0x2100
    li x4, 0x7000
    li x7, 0x2110

loop:
    li x2, 0xaaaaaaaa
    sw x2, 0(x3)
    lw x6, 0(x3)
    sw x6, 0(x4)

    jal x1, delay_1s

    li x2, 0x55555555
    sw x2, 0(x7)
    lw x6, 0(x7)
    sw x6, 0(x4)

    jal x1, delay_1s

    j loop

delay_1s:
    li t0, 6250000   # Load 50 million into t0 (1 second delay for 50 MHz clock)
delay_loop:
    addi t0, t0, -1      # Decrement the counter
    bne t0, x0, delay_loop  # If t0 is not zero, branch back to delay_loop
    jalr x0,x1,0                  # Return from the function