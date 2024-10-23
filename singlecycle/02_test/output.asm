
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000013          	nop
   4:	00000013          	nop
   8:	00000013          	nop
   c:	000071b7          	lui	gp,0x7
  10:	03018193          	addi	gp,gp,48 # 7030 <delay_loop+0x6cdc>
  14:	c0000237          	lui	tp,0xc0000
  18:	0041a023          	sw	tp,0(gp)
  1c:	00a00193          	li	gp,10
  20:	00a00213          	li	tp,10
  24:	00600393          	li	t2,6
  28:	00000a13          	li	s4,0
  2c:	00000a93          	li	s5,0
  30:	00000b13          	li	s6,0
  34:	00000b93          	li	s7,0
  38:	00000c13          	li	s8,0
  3c:	00000c93          	li	s9,0
  40:	00000d13          	li	s10,0
  44:	00000d93          	li	s11,0
  48:	00007137          	lui	sp,0x7
  4c:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x6ccc>
  50:	00008437          	lui	s0,0x8
  54:	81040413          	addi	s0,s0,-2032 # 7810 <delay_loop+0x74bc>
  58:	000a0513          	mv	a0,s4
  5c:	1ec000ef          	jal	248 <seven_seg_decode>
  60:	00610023          	sb	t1,0(sp)
  64:	000a8513          	mv	a0,s5
  68:	1e0000ef          	jal	248 <seven_seg_decode>
  6c:	006100a3          	sb	t1,1(sp)
  70:	000b0513          	mv	a0,s6
  74:	1d4000ef          	jal	248 <seven_seg_decode>
  78:	00610123          	sb	t1,2(sp)
  7c:	000b8513          	mv	a0,s7
  80:	1c8000ef          	jal	248 <seven_seg_decode>
  84:	006101a3          	sb	t1,3(sp)
  88:	000c0513          	mv	a0,s8
  8c:	1bc000ef          	jal	248 <seven_seg_decode>
  90:	00610223          	sb	t1,4(sp)
  94:	000c8513          	mv	a0,s9
  98:	1b0000ef          	jal	248 <seven_seg_decode>
  9c:	006102a3          	sb	t1,5(sp)
  a0:	000d0513          	mv	a0,s10
  a4:	1a4000ef          	jal	248 <seven_seg_decode>
  a8:	00610323          	sb	t1,6(sp)
  ac:	000d8513          	mv	a0,s11
  b0:	198000ef          	jal	248 <seven_seg_decode>
  b4:	006103a3          	sb	t1,7(sp)

000000b8 <here>:
  b8:	00040583          	lb	a1,0(s0)
  bc:	0085f613          	andi	a2,a1,8
  c0:	00061463          	bnez	a2,c8 <skip>
  c4:	12c000ef          	jal	1f0 <stop>

000000c8 <skip>:
  c8:	000a0513          	mv	a0,s4
  cc:	17c000ef          	jal	248 <seven_seg_decode>
  d0:	00610023          	sb	t1,0(sp)
  d4:	001a0a13          	addi	s4,s4,1
  d8:	274000ef          	jal	34c <delay_10ms>
  dc:	fc3a1ee3          	bne	s4,gp,b8 <here>
  e0:	00000a13          	li	s4,0
  e4:	000a0513          	mv	a0,s4
  e8:	160000ef          	jal	248 <seven_seg_decode>
  ec:	00610023          	sb	t1,0(sp)
  f0:	001a8a93          	addi	s5,s5,1
  f4:	000a8513          	mv	a0,s5
  f8:	150000ef          	jal	248 <seven_seg_decode>
  fc:	006100a3          	sb	t1,1(sp)
 100:	fb521ce3          	bne	tp,s5,b8 <here>
 104:	00000a93          	li	s5,0
 108:	000a8513          	mv	a0,s5
 10c:	13c000ef          	jal	248 <seven_seg_decode>
 110:	006100a3          	sb	t1,1(sp)
 114:	001b0b13          	addi	s6,s6,1
 118:	000b0513          	mv	a0,s6
 11c:	12c000ef          	jal	248 <seven_seg_decode>
 120:	00610123          	sb	t1,2(sp)
 124:	f9621ae3          	bne	tp,s6,b8 <here>
 128:	00000b13          	li	s6,0
 12c:	000b0513          	mv	a0,s6
 130:	118000ef          	jal	248 <seven_seg_decode>
 134:	00610123          	sb	t1,2(sp)
 138:	001b8b93          	addi	s7,s7,1
 13c:	000b8513          	mv	a0,s7
 140:	108000ef          	jal	248 <seven_seg_decode>
 144:	006101a3          	sb	t1,3(sp)
 148:	f77398e3          	bne	t2,s7,b8 <here>
 14c:	00000b93          	li	s7,0
 150:	000b8513          	mv	a0,s7
 154:	0f4000ef          	jal	248 <seven_seg_decode>
 158:	006101a3          	sb	t1,3(sp)
 15c:	001c0c13          	addi	s8,s8,1
 160:	000c0513          	mv	a0,s8
 164:	0e4000ef          	jal	248 <seven_seg_decode>
 168:	00610223          	sb	t1,4(sp)
 16c:	f58216e3          	bne	tp,s8,b8 <here>
 170:	00000c13          	li	s8,0
 174:	000c0513          	mv	a0,s8
 178:	0d0000ef          	jal	248 <seven_seg_decode>
 17c:	00610223          	sb	t1,4(sp)
 180:	001c8c93          	addi	s9,s9,1
 184:	000c8513          	mv	a0,s9
 188:	0c0000ef          	jal	248 <seven_seg_decode>
 18c:	006102a3          	sb	t1,5(sp)
 190:	f39394e3          	bne	t2,s9,b8 <here>
 194:	00000c93          	li	s9,0
 198:	000c8513          	mv	a0,s9
 19c:	0ac000ef          	jal	248 <seven_seg_decode>
 1a0:	006102a3          	sb	t1,5(sp)
 1a4:	001d0d13          	addi	s10,s10,1
 1a8:	000d0513          	mv	a0,s10
 1ac:	09c000ef          	jal	248 <seven_seg_decode>
 1b0:	00610323          	sb	t1,6(sp)
 1b4:	f1a212e3          	bne	tp,s10,b8 <here>
 1b8:	00000d13          	li	s10,0
 1bc:	000d0513          	mv	a0,s10
 1c0:	088000ef          	jal	248 <seven_seg_decode>
 1c4:	00610323          	sb	t1,6(sp)
 1c8:	001d8d93          	addi	s11,s11,1
 1cc:	000d8513          	mv	a0,s11
 1d0:	078000ef          	jal	248 <seven_seg_decode>
 1d4:	006103a3          	sb	t1,7(sp)
 1d8:	efb210e3          	bne	tp,s11,b8 <here>
 1dc:	00000d93          	li	s11,0
 1e0:	000d8513          	mv	a0,s11
 1e4:	064000ef          	jal	248 <seven_seg_decode>
 1e8:	006103a3          	sb	t1,7(sp)
 1ec:	ecdff06f          	j	b8 <here>

000001f0 <stop>:
 1f0:	00008713          	mv	a4,ra
 1f4:	00000693          	li	a3,0

000001f8 <P_WAIT>:
 1f8:	00040583          	lb	a1,0(s0)
 1fc:	0085f613          	andi	a2,a1,8
 200:	fe061ce3          	bnez	a2,1f8 <P_WAIT>
 204:	148000ef          	jal	34c <delay_10ms>
 208:	144000ef          	jal	34c <delay_10ms>
 20c:	00040583          	lb	a1,0(s0)
 210:	0085f613          	andi	a2,a1,8
 214:	fe0612e3          	bnez	a2,1f8 <P_WAIT>

00000218 <R_WAIT>:
 218:	00040583          	lb	a1,0(s0)
 21c:	0085f613          	andi	a2,a1,8
 220:	fe060ce3          	beqz	a2,218 <R_WAIT>
 224:	128000ef          	jal	34c <delay_10ms>
 228:	124000ef          	jal	34c <delay_10ms>
 22c:	00040583          	lb	a1,0(s0)
 230:	0085f613          	andi	a2,a1,8
 234:	fe0602e3          	beqz	a2,218 <R_WAIT>
 238:	00069663          	bnez	a3,244 <run>
 23c:	00168693          	addi	a3,a3,1
 240:	fb9ff06f          	j	1f8 <P_WAIT>

00000244 <run>:
 244:	00070067          	jr	a4

00000248 <seven_seg_decode>:
 248:	00000293          	li	t0,0
 24c:	08550063          	beq	a0,t0,2cc <display_0>
 250:	00100293          	li	t0,1
 254:	08550063          	beq	a0,t0,2d4 <display_1>
 258:	00200293          	li	t0,2
 25c:	08550063          	beq	a0,t0,2dc <display_2>
 260:	00300293          	li	t0,3
 264:	08550063          	beq	a0,t0,2e4 <display_3>
 268:	00400293          	li	t0,4
 26c:	08550063          	beq	a0,t0,2ec <display_4>
 270:	00500293          	li	t0,5
 274:	08550063          	beq	a0,t0,2f4 <display_5>
 278:	00600293          	li	t0,6
 27c:	08550063          	beq	a0,t0,2fc <display_6>
 280:	00700293          	li	t0,7
 284:	08550063          	beq	a0,t0,304 <display_7>
 288:	00800293          	li	t0,8
 28c:	08550063          	beq	a0,t0,30c <display_8>
 290:	00900293          	li	t0,9
 294:	08550063          	beq	a0,t0,314 <display_9>
 298:	00a00293          	li	t0,10
 29c:	08550063          	beq	a0,t0,31c <display_A>
 2a0:	00b00293          	li	t0,11
 2a4:	08550063          	beq	a0,t0,324 <display_B>
 2a8:	00c00293          	li	t0,12
 2ac:	08550063          	beq	a0,t0,32c <display_C>
 2b0:	00d00293          	li	t0,13
 2b4:	08550063          	beq	a0,t0,334 <display_D>
 2b8:	00e00293          	li	t0,14
 2bc:	08550063          	beq	a0,t0,33c <display_E>
 2c0:	00f00293          	li	t0,15
 2c4:	08550063          	beq	a0,t0,344 <display_F>
 2c8:	00008067          	ret

000002cc <display_0>:
 2cc:	04000313          	li	t1,64
 2d0:	00008067          	ret

000002d4 <display_1>:
 2d4:	07900313          	li	t1,121
 2d8:	00008067          	ret

000002dc <display_2>:
 2dc:	02400313          	li	t1,36
 2e0:	00008067          	ret

000002e4 <display_3>:
 2e4:	03000313          	li	t1,48
 2e8:	00008067          	ret

000002ec <display_4>:
 2ec:	01900313          	li	t1,25
 2f0:	00008067          	ret

000002f4 <display_5>:
 2f4:	01200313          	li	t1,18
 2f8:	00008067          	ret

000002fc <display_6>:
 2fc:	00200313          	li	t1,2
 300:	00008067          	ret

00000304 <display_7>:
 304:	07800313          	li	t1,120
 308:	00008067          	ret

0000030c <display_8>:
 30c:	00000313          	li	t1,0
 310:	00008067          	ret

00000314 <display_9>:
 314:	01000313          	li	t1,16
 318:	00008067          	ret

0000031c <display_A>:
 31c:	00800313          	li	t1,8
 320:	00008067          	ret

00000324 <display_B>:
 324:	00300313          	li	t1,3
 328:	00008067          	ret

0000032c <display_C>:
 32c:	04600313          	li	t1,70
 330:	00008067          	ret

00000334 <display_D>:
 334:	02100313          	li	t1,33
 338:	00008067          	ret

0000033c <display_E>:
 33c:	00600313          	li	t1,6
 340:	00008067          	ret

00000344 <display_F>:
 344:	00e00313          	li	t1,14
 348:	00008067          	ret

0000034c <delay_10ms>:
 34c:	0001f2b7          	lui	t0,0x1f
 350:	84828293          	addi	t0,t0,-1976 # 1e848 <delay_loop+0x1e4f4>

00000354 <delay_loop>:
 354:	fff28293          	addi	t0,t0,-1
 358:	fe029ee3          	bnez	t0,354 <delay_loop>
 35c:	00008067          	ret
