.PHONY: comp sim
comp:
	iverilog -g2012 -s adder_tb -o adder_tb.vvp -c Filelist.f

sim:
	truncate -s 0 result.log
	vvp adder_tb.vvp

wave:
	gtkwave adder_tb.vcd

run:
	make comp && make sim && (cd ../tb && ./checker.sh)
