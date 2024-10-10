.PHONY: comp sim wave run

comp:
	iverilog -g2012 -s tb -o lsu.vvp -c Filelist.f

sim:
	vvp lsu_tb.vvp

wave:
	gtkwave lsu_tb.vcd

run:
	make comp && make sim
