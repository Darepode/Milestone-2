
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	000021b7          	lui	gp,0x2
   4:	10018193          	addi	gp,gp,256 # 2100 <delay_loop+0x20b0>
   8:	00007237          	lui	tp,0x7
   c:	000023b7          	lui	t2,0x2
  10:	11038393          	addi	t2,t2,272 # 2110 <delay_loop+0x20c0>

00000014 <loop>:
  14:	aaaab137          	lui	sp,0xaaaab
  18:	aaa10113          	addi	sp,sp,-1366 # aaaaaaaa <delay_loop+0xaaaaaa5a>
  1c:	0021a023          	sw	sp,0(gp)
  20:	0001a303          	lw	t1,0(gp)
  24:	00622023          	sw	t1,0(tp) # 7000 <delay_loop+0x6fb0>
  28:	020000ef          	jal	48 <delay_1s>
  2c:	55555137          	lui	sp,0x55555
  30:	55510113          	addi	sp,sp,1365 # 55555555 <delay_loop+0x55555505>
  34:	0023a023          	sw	sp,0(t2)
  38:	0003a303          	lw	t1,0(t2)
  3c:	00622023          	sw	t1,0(tp) # 0 <_start>
  40:	008000ef          	jal	48 <delay_1s>
  44:	fd1ff06f          	j	14 <loop>

00000048 <delay_1s>:
  48:	005f62b7          	lui	t0,0x5f6
  4c:	e1028293          	addi	t0,t0,-496 # 5f5e10 <delay_loop+0x5f5dc0>

00000050 <delay_loop>:
  50:	fff28293          	addi	t0,t0,-1
  54:	fe029ee3          	bnez	t0,50 <delay_loop>
  58:	00008067          	ret
