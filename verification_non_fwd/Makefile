.PHONY: comp sim run wave

comp:
	iverilog -g2012 -s tb -o tb.vvp -f filelist.txt -I tb/

sim:
	vvp tb.vvp

run:
	make comp && make sim

wave:
	gtkwave tb.vcd

gen_test:
	python3 script/generate_rv32i_asm.py 200

gen_hex:
	riscv32-unknown-elf-objcopy -O verilog riscv_asm_test.o test_in.hex

run_spike:
	riscv32-unknown-elf-as -o riscv_asm_test.o test.asm && \
	riscv32-unknown-elf-ld -Map=riscv_asm_test.map -T riscv.ld -o riscv_asm_test riscv_asm_test.o && \
	spike -m0x2000:0x10000000 --isa=RV32I -l --log-commits riscv_asm_test 2> logs/spike_ori.log

run_1:
	spike -m0x2000:0x10000000 --isa=RV32I --log-commits riscv_asm_test 2> logs/spike.log

clean_log:
	python3 script/clean_log.py && rm logs/spike_ori.log && \
	python3 script/clean_log1.py && rm logs/spike.log
	


	