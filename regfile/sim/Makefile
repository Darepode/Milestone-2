.PHONY: comp sim wave run

comp:
	iverilog -g2012 -s regfile_tb -o regfile_tb.vvp -c Filelist.f

sim:
	vvp regfile_tb.vvp

wave:
	gtkwave regfile_tb.vcd

run:
	make comp && make sim
