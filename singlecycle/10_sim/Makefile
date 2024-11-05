.PHONY: comp sim wave run

TEST_NAME=RAM

comp:
	iverilog -g2012 -s singlecycle_tb -o singlecycle_tb.vvp -c Filelist.f

sim:
	vvp singlecycle_tb.vvp

wave:
	gtkwave singlecycle_tb.vcd

hex:
	riscv32-unknown-elf-as -o ../02_test/test_assembly.o ../02_test/$(TEST_NAME).asm &&\
	riscv32-unknown-elf-objcopy -O verilog ../02_test/test_assembly.o ../02_test/dump/mem.dump &&\
	riscv32-unknown-elf-objdump -d ../02_test/test_assembly.o > ../02_test/output.asm &&\
    (cd ../02_test/dump && python3 imem_file_gen.py) &&\
	cp /home/datpham/CTMT/Milestone2/singlecycle/02_test/dump/mem_padded.dump /mnt/d/CTMT/MileStone2/singlecycle/02_test
run:
	make hex && make comp && make sim