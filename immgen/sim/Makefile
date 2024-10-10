.PHONY: comp sim

comp:
	iverilog -g2012 -s alu_tb -o alu_tb.vvp -c Filelist.f

sim:
	vvp alu_tb.vvp

wave:
	gtkwave alu_tb.vcd

run:
	make comp && make sim
