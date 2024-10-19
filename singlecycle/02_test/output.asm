
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00007237          	lui	tp,0x7
   4:	aaaab137          	lui	sp,0xaaaab
   8:	aaa10113          	addi	sp,sp,-1366 # aaaaaaaa <delay_loop+0xaaaaaa76>
   c:	555551b7          	lui	gp,0x55555
  10:	55518193          	addi	gp,gp,1365 # 55555555 <delay_loop+0x55555521>

00000014 <here>:
  14:	00010313          	mv	t1,sp
  18:	00622023          	sw	t1,0(tp) # 7000 <delay_loop+0x6fcc>
  1c:	014000ef          	jal	30 <delay_1s>
  20:	00018313          	mv	t1,gp
  24:	00622023          	sw	t1,0(tp) # 0 <_start>
  28:	008000ef          	jal	30 <delay_1s>
  2c:	fe9ff06f          	j	14 <here>

00000030 <delay_1s>:
  30:	00500293          	li	t0,5

00000034 <delay_loop>:
  34:	fff28293          	addi	t0,t0,-1
  38:	fe029ee3          	bnez	t0,34 <delay_loop>
  3c:	00008067          	ret
