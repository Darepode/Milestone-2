.PHONY: comp sim wave run

comp:
	iverilog -g2012 -s tb -o brcomp_tb.vvp -c Filelist.f

sim:
	vvp brcomp_tb.vvp

wave:
	gtkwave brcomp_tb.vcd

run:
	make comp && make sim
