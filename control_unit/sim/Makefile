.PHONY: comp sim

comp:
	iverilog -g2012 -s ctrl_unit_tb -o ctrl_unit_tb.vvp -c Filelist.f

sim:
	vvp ctrl_unit_tb.vvp

wave:
	gtkwave ctrl_unit_tb.vcd

run:
	make comp && make sim
