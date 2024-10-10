.PHONY: comp sim wave run

comp:
	@iverilog -g2012 -s alu_tb -o alu_tb.vvp -c Filelist.f

sim:
	@truncate -s 0 result.log
	@vvp alu_tb.vvp

wave:
	gtkwave alu_tb.vcd

run:
	@make comp && make sim && (cd ../tb && ./checker.sh)
