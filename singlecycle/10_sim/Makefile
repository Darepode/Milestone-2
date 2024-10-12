.PHONY: comp sim wave run

comp:
	iverilog -g2012 -s singlecycle_tb -o singlecycle_tb.vvp -c Filelist.f

sim:
	vvp singlecycle_tb.vvp

wave:
	gtkwave singlecycle_tb.vcd

hex:
	riscv32-unknown-elf-as -o ../02_test/test_assembly.o ../02_test/test.asm
	riscv32-unknown-elf-objcopy -O verilog ../02_test/test_assembly.o ../02_test/test_in.hex

run:
	make comp && make sim 