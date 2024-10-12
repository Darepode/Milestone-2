.PHONY: comp sim wave run

comp:
	iverilog -g2012 -s singlecycle_tb -o singlecycle_tb.vvp -c Filelist.f

sim:
	vvp singlecycle_tb.vvp

wave:
	gtkwave singlecycle_tb.vcd

run:
	make comp && make sim 