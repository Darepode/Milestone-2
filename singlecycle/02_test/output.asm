
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00007137          	lui	sp,0x7
   4:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x6eec>
   8:	01000593          	li	a1,16

0000000c <here>:
   c:	01c000ef          	jal	28 <seven_seg_decode>
  10:	00610023          	sb	t1,0(sp)
  14:	118000ef          	jal	12c <delay_1s>
  18:	00150513          	addi	a0,a0,1
  1c:	fea598e3          	bne	a1,a0,c <here>
  20:	00000513          	li	a0,0
  24:	fe9ff06f          	j	c <here>

00000028 <seven_seg_decode>:
  28:	00000293          	li	t0,0
  2c:	08550063          	beq	a0,t0,ac <display_0>
  30:	00100293          	li	t0,1
  34:	08550063          	beq	a0,t0,b4 <display_1>
  38:	00200293          	li	t0,2
  3c:	08550063          	beq	a0,t0,bc <display_2>
  40:	00300293          	li	t0,3
  44:	08550063          	beq	a0,t0,c4 <display_3>
  48:	00400293          	li	t0,4
  4c:	08550063          	beq	a0,t0,cc <display_4>
  50:	00500293          	li	t0,5
  54:	08550063          	beq	a0,t0,d4 <display_5>
  58:	00600293          	li	t0,6
  5c:	08550063          	beq	a0,t0,dc <display_6>
  60:	00700293          	li	t0,7
  64:	08550063          	beq	a0,t0,e4 <display_7>
  68:	00800293          	li	t0,8
  6c:	08550063          	beq	a0,t0,ec <display_8>
  70:	00900293          	li	t0,9
  74:	08550063          	beq	a0,t0,f4 <display_9>
  78:	00a00293          	li	t0,10
  7c:	08550063          	beq	a0,t0,fc <display_A>
  80:	00b00293          	li	t0,11
  84:	08550063          	beq	a0,t0,104 <display_B>
  88:	00c00293          	li	t0,12
  8c:	08550063          	beq	a0,t0,10c <display_C>
  90:	00d00293          	li	t0,13
  94:	08550063          	beq	a0,t0,114 <display_D>
  98:	00e00293          	li	t0,14
  9c:	08550063          	beq	a0,t0,11c <display_E>
  a0:	00f00293          	li	t0,15
  a4:	08550063          	beq	a0,t0,124 <display_F>
  a8:	00008067          	ret

000000ac <display_0>:
  ac:	04000313          	li	t1,64
  b0:	00008067          	ret

000000b4 <display_1>:
  b4:	07900313          	li	t1,121
  b8:	00008067          	ret

000000bc <display_2>:
  bc:	02400313          	li	t1,36
  c0:	00008067          	ret

000000c4 <display_3>:
  c4:	03000313          	li	t1,48
  c8:	00008067          	ret

000000cc <display_4>:
  cc:	01900313          	li	t1,25
  d0:	00008067          	ret

000000d4 <display_5>:
  d4:	01200313          	li	t1,18
  d8:	00008067          	ret

000000dc <display_6>:
  dc:	00200313          	li	t1,2
  e0:	00008067          	ret

000000e4 <display_7>:
  e4:	07800313          	li	t1,120
  e8:	00008067          	ret

000000ec <display_8>:
  ec:	00000313          	li	t1,0
  f0:	00008067          	ret

000000f4 <display_9>:
  f4:	01000313          	li	t1,16
  f8:	00008067          	ret

000000fc <display_A>:
  fc:	00800313          	li	t1,8
 100:	00008067          	ret

00000104 <display_B>:
 104:	00300313          	li	t1,3
 108:	00008067          	ret

0000010c <display_C>:
 10c:	04600313          	li	t1,70
 110:	00008067          	ret

00000114 <display_D>:
 114:	02100313          	li	t1,33
 118:	00008067          	ret

0000011c <display_E>:
 11c:	00600313          	li	t1,6
 120:	00008067          	ret

00000124 <display_F>:
 124:	00e00313          	li	t1,14
 128:	00008067          	ret

0000012c <delay_1s>:
 12c:	017d82b7          	lui	t0,0x17d8
 130:	84028293          	addi	t0,t0,-1984 # 17d7840 <delay_loop+0x17d770c>

00000134 <delay_loop>:
 134:	fff28293          	addi	t0,t0,-1
 138:	fe029ee3          	bnez	t0,134 <delay_loop>
 13c:	00008067          	ret
