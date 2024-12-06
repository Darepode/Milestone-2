OUTPUT_ARCH("riscv")

ENTRY(_start)

SECTIONS
{
    /* Start of memory at 0x2000 */
    . = 0x2000;

    /* Tohost section */
    .tohost : ALIGN(0x1000)
    {
        *(.tohost)
    }

    /* Padding to next 4KB boundary */
    . += 0x1000;

    /* Text (code) section */
    .text : ALIGN(0x1000)
    {
        *(.text)
    }

    /* Read-only data section */
    .rodata : ALIGN(0x1000)
    {
        *(.rodata)
    }

    /* Data section for initialized variables */
    .data : ALIGN(0x1000)
    {
        *(.data)
    }

    /* BSS section for uninitialized variables */
    .bss : ALIGN(0x1000)
    {
        *(COMMON)
        *(.bss)
    }

    /* Stack setup: reserve 8KB for the stack */
    .stack (NOLOAD) : ALIGN(0x1000)
    {
        . = . + 0x2000; /* 8KB stack */
    }

    /* End of memory */
    _end = .;

    /* Set stack pointer to the top of the stack */
    _stack = _end;
}
