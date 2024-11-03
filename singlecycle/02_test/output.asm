
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000013          	nop
   4:	00000013          	nop
   8:	00000013          	nop

0000000c <power_reset_lcd>:
   c:	00007137          	lui	sp,0x7
  10:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x6a34>
  14:	c00001b7          	lui	gp,0xc0000
  18:	00312023          	sw	gp,0(sp)
  1c:	0001f1b7          	lui	gp,0x1f
  20:	84718193          	addi	gp,gp,-1977 # 1e847 <delay_loop+0x1e24b>
  24:	5bc000ef          	jal	5e0 <delay>
  28:	00000213          	li	tp,0
  2c:	03000193          	li	gp,48
  30:	098000ef          	jal	c8 <out_lcd>
  34:	000061b7          	lui	gp,0x6
  38:	68918193          	addi	gp,gp,1673 # 6689 <delay_loop+0x608d>
  3c:	5a4000ef          	jal	5e0 <delay>
  40:	00000213          	li	tp,0
  44:	03000193          	li	gp,48
  48:	080000ef          	jal	c8 <out_lcd>
  4c:	000031b7          	lui	gp,0x3
  50:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2ad7>
  54:	58c000ef          	jal	5e0 <delay>
  58:	00000213          	li	tp,0
  5c:	03000193          	li	gp,48
  60:	068000ef          	jal	c8 <out_lcd>
  64:	000031b7          	lui	gp,0x3
  68:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2ad7>
  6c:	574000ef          	jal	5e0 <delay>

00000070 <init_lcd>:
  70:	00000213          	li	tp,0
  74:	03800193          	li	gp,56
  78:	050000ef          	jal	c8 <out_lcd>
  7c:	27000193          	li	gp,624
  80:	560000ef          	jal	5e0 <delay>
  84:	00000213          	li	tp,0
  88:	00100193          	li	gp,1
  8c:	03c000ef          	jal	c8 <out_lcd>
  90:	000031b7          	lui	gp,0x3
  94:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2ad7>
  98:	548000ef          	jal	5e0 <delay>
  9c:	00000213          	li	tp,0
  a0:	00c00193          	li	gp,12
  a4:	024000ef          	jal	c8 <out_lcd>
  a8:	27000193          	li	gp,624
  ac:	534000ef          	jal	5e0 <delay>
  b0:	00000213          	li	tp,0
  b4:	00600193          	li	gp,6
  b8:	010000ef          	jal	c8 <out_lcd>
  bc:	27000193          	li	gp,624
  c0:	520000ef          	jal	5e0 <delay>
  c4:	17c0006f          	j	240 <init_prog>

000000c8 <out_lcd>:
  c8:	00008393          	mv	t2,ra
  cc:	00007137          	lui	sp,0x7
  d0:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x6a34>
  d4:	000f0663          	beqz	t5,e0 <command>
  d8:	60018193          	addi	gp,gp,1536
  dc:	0080006f          	j	e4 <send>

000000e0 <command>:
  e0:	40018193          	addi	gp,gp,1024

000000e4 <send>:
  e4:	00311023          	sh	gp,0(sp)
  e8:	27000193          	li	gp,624
  ec:	4f4000ef          	jal	5e0 <delay>
  f0:	000110a3          	sh	zero,1(sp)
  f4:	00038093          	mv	ra,t2
  f8:	00a00193          	li	gp,10
  fc:	00600393          	li	t2,6
 100:	00007137          	lui	sp,0x7
 104:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x6a24>
 108:	00008067          	ret

0000010c <P_WAIT1>:
 10c:	00040583          	lb	a1,0(s0)
 110:	0045f613          	andi	a2,a1,4
 114:	fe061ce3          	bnez	a2,10c <P_WAIT1>
 118:	4dc000ef          	jal	5f4 <delay_10ms>
 11c:	4d8000ef          	jal	5f4 <delay_10ms>
 120:	00040583          	lb	a1,0(s0)
 124:	0045f613          	andi	a2,a1,4
 128:	fe0612e3          	bnez	a2,10c <P_WAIT1>

0000012c <R_WAIT1>:
 12c:	00040583          	lb	a1,0(s0)
 130:	0045f613          	andi	a2,a1,4
 134:	fe060ce3          	beqz	a2,12c <R_WAIT1>
 138:	4bc000ef          	jal	5f4 <delay_10ms>
 13c:	4b8000ef          	jal	5f4 <delay_10ms>
 140:	00040583          	lb	a1,0(s0)
 144:	0045f613          	andi	a2,a1,4
 148:	fe0602e3          	beqz	a2,12c <R_WAIT1>
 14c:	00100f13          	li	t5,1
 150:	000e8193          	mv	gp,t4
 154:	f75ff0ef          	jal	c8 <out_lcd>
 158:	27000193          	li	gp,624
 15c:	484000ef          	jal	5e0 <delay>
 160:	00100f13          	li	t5,1
 164:	000e0193          	mv	gp,t3
 168:	f61ff0ef          	jal	c8 <out_lcd>
 16c:	27000193          	li	gp,624
 170:	470000ef          	jal	5e0 <delay>
 174:	00100f13          	li	t5,1
 178:	03a00193          	li	gp,58
 17c:	f4dff0ef          	jal	c8 <out_lcd>
 180:	27000193          	li	gp,624
 184:	45c000ef          	jal	5e0 <delay>
 188:	00100f13          	li	t5,1
 18c:	00098193          	mv	gp,s3
 190:	f39ff0ef          	jal	c8 <out_lcd>
 194:	27000193          	li	gp,624
 198:	448000ef          	jal	5e0 <delay>
 19c:	00100f13          	li	t5,1
 1a0:	00090193          	mv	gp,s2
 1a4:	f25ff0ef          	jal	c8 <out_lcd>
 1a8:	27000193          	li	gp,624
 1ac:	434000ef          	jal	5e0 <delay>
 1b0:	00100f13          	li	t5,1
 1b4:	03a00193          	li	gp,58
 1b8:	f11ff0ef          	jal	c8 <out_lcd>
 1bc:	27000193          	li	gp,624
 1c0:	420000ef          	jal	5e0 <delay>
 1c4:	00100f13          	li	t5,1
 1c8:	00088193          	mv	gp,a7
 1cc:	efdff0ef          	jal	c8 <out_lcd>
 1d0:	27000193          	li	gp,624
 1d4:	40c000ef          	jal	5e0 <delay>
 1d8:	00100f13          	li	t5,1
 1dc:	00080193          	mv	gp,a6
 1e0:	ee9ff0ef          	jal	c8 <out_lcd>
 1e4:	27000193          	li	gp,624
 1e8:	3f8000ef          	jal	5e0 <delay>
 1ec:	00100f13          	li	t5,1
 1f0:	03a00193          	li	gp,58
 1f4:	ed5ff0ef          	jal	c8 <out_lcd>
 1f8:	27000193          	li	gp,624
 1fc:	3e4000ef          	jal	5e0 <delay>
 200:	00100f13          	li	t5,1
 204:	00078193          	mv	gp,a5
 208:	ec1ff0ef          	jal	c8 <out_lcd>
 20c:	27000193          	li	gp,624
 210:	3d0000ef          	jal	5e0 <delay>
 214:	00100f13          	li	t5,1
 218:	00048193          	mv	gp,s1
 21c:	eadff0ef          	jal	c8 <out_lcd>
 220:	27000193          	li	gp,624
 224:	3bc000ef          	jal	5e0 <delay>
 228:	00000f13          	li	t5,0
 22c:	05300193          	li	gp,83
 230:	e99ff0ef          	jal	c8 <out_lcd>
 234:	27000193          	li	gp,624
 238:	3a8000ef          	jal	5e0 <delay>
 23c:	000f8067          	jr	t6

00000240 <init_prog>:
 240:	00a00193          	li	gp,10
 244:	00a00213          	li	tp,10
 248:	00600393          	li	t2,6
 24c:	00000a13          	li	s4,0
 250:	00000a93          	li	s5,0
 254:	00000b13          	li	s6,0
 258:	00000b93          	li	s7,0
 25c:	00000c13          	li	s8,0
 260:	00000c93          	li	s9,0
 264:	00000d13          	li	s10,0
 268:	00000d93          	li	s11,0
 26c:	03000493          	li	s1,48
 270:	03000793          	li	a5,48
 274:	03000813          	li	a6,48
 278:	03000893          	li	a7,48
 27c:	03000913          	li	s2,48
 280:	03000993          	li	s3,48
 284:	03000e13          	li	t3,48
 288:	03000e93          	li	t4,48
 28c:	00007137          	lui	sp,0x7
 290:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x6a24>
 294:	00008437          	lui	s0,0x8
 298:	81040413          	addi	s0,s0,-2032 # 7810 <delay_loop+0x7214>
 29c:	000a0513          	mv	a0,s4
 2a0:	23c000ef          	jal	4dc <seven_seg_decode>
 2a4:	00610023          	sb	t1,0(sp)
 2a8:	000a8513          	mv	a0,s5
 2ac:	230000ef          	jal	4dc <seven_seg_decode>
 2b0:	006100a3          	sb	t1,1(sp)
 2b4:	000b0513          	mv	a0,s6
 2b8:	224000ef          	jal	4dc <seven_seg_decode>
 2bc:	00610123          	sb	t1,2(sp)
 2c0:	000b8513          	mv	a0,s7
 2c4:	218000ef          	jal	4dc <seven_seg_decode>
 2c8:	006101a3          	sb	t1,3(sp)
 2cc:	000c0513          	mv	a0,s8
 2d0:	20c000ef          	jal	4dc <seven_seg_decode>
 2d4:	00610223          	sb	t1,4(sp)
 2d8:	000c8513          	mv	a0,s9
 2dc:	200000ef          	jal	4dc <seven_seg_decode>
 2e0:	006102a3          	sb	t1,5(sp)
 2e4:	000d0513          	mv	a0,s10
 2e8:	1f4000ef          	jal	4dc <seven_seg_decode>
 2ec:	00610323          	sb	t1,6(sp)
 2f0:	000d8513          	mv	a0,s11
 2f4:	1e8000ef          	jal	4dc <seven_seg_decode>
 2f8:	006103a3          	sb	t1,7(sp)

000002fc <here>:
 2fc:	00040583          	lb	a1,0(s0)
 300:	0085f613          	andi	a2,a1,8
 304:	00061463          	bnez	a2,30c <check1>
 308:	17c000ef          	jal	484 <stop>

0000030c <check1>:
 30c:	00040583          	lb	a1,0(s0)
 310:	0045f613          	andi	a2,a1,4
 314:	00061463          	bnez	a2,31c <skip>
 318:	df5fffef          	jal	t6,10c <P_WAIT1>

0000031c <skip>:
 31c:	000a0513          	mv	a0,s4
 320:	030a0493          	addi	s1,s4,48
 324:	1b8000ef          	jal	4dc <seven_seg_decode>
 328:	00610023          	sb	t1,0(sp)
 32c:	001a0a13          	addi	s4,s4,1
 330:	2c4000ef          	jal	5f4 <delay_10ms>
 334:	fc3a14e3          	bne	s4,gp,2fc <here>
 338:	00000a13          	li	s4,0
 33c:	000a0513          	mv	a0,s4
 340:	030a0493          	addi	s1,s4,48
 344:	198000ef          	jal	4dc <seven_seg_decode>
 348:	00610023          	sb	t1,0(sp)
 34c:	001a8a93          	addi	s5,s5,1
 350:	000a8513          	mv	a0,s5
 354:	030a8793          	addi	a5,s5,48
 358:	184000ef          	jal	4dc <seven_seg_decode>
 35c:	006100a3          	sb	t1,1(sp)
 360:	f9521ee3          	bne	tp,s5,2fc <here>
 364:	00000a93          	li	s5,0
 368:	000a8513          	mv	a0,s5
 36c:	030a8793          	addi	a5,s5,48
 370:	16c000ef          	jal	4dc <seven_seg_decode>
 374:	006100a3          	sb	t1,1(sp)
 378:	001b0b13          	addi	s6,s6,1
 37c:	000b0513          	mv	a0,s6
 380:	030b0813          	addi	a6,s6,48
 384:	158000ef          	jal	4dc <seven_seg_decode>
 388:	00610123          	sb	t1,2(sp)
 38c:	f76218e3          	bne	tp,s6,2fc <here>
 390:	00000b13          	li	s6,0
 394:	000b0513          	mv	a0,s6
 398:	030b0813          	addi	a6,s6,48
 39c:	140000ef          	jal	4dc <seven_seg_decode>
 3a0:	00610123          	sb	t1,2(sp)
 3a4:	001b8b93          	addi	s7,s7,1
 3a8:	000b8513          	mv	a0,s7
 3ac:	030b8893          	addi	a7,s7,48
 3b0:	12c000ef          	jal	4dc <seven_seg_decode>
 3b4:	006101a3          	sb	t1,3(sp)
 3b8:	f57392e3          	bne	t2,s7,2fc <here>
 3bc:	00000b93          	li	s7,0
 3c0:	000b8513          	mv	a0,s7
 3c4:	030b8893          	addi	a7,s7,48
 3c8:	114000ef          	jal	4dc <seven_seg_decode>
 3cc:	006101a3          	sb	t1,3(sp)
 3d0:	001c0c13          	addi	s8,s8,1
 3d4:	000c0513          	mv	a0,s8
 3d8:	030c0913          	addi	s2,s8,48
 3dc:	100000ef          	jal	4dc <seven_seg_decode>
 3e0:	00610223          	sb	t1,4(sp)
 3e4:	f1821ce3          	bne	tp,s8,2fc <here>
 3e8:	00000c13          	li	s8,0
 3ec:	000c0513          	mv	a0,s8
 3f0:	030c0913          	addi	s2,s8,48
 3f4:	0e8000ef          	jal	4dc <seven_seg_decode>
 3f8:	00610223          	sb	t1,4(sp)
 3fc:	001c8c93          	addi	s9,s9,1
 400:	000c8513          	mv	a0,s9
 404:	030c8993          	addi	s3,s9,48
 408:	0d4000ef          	jal	4dc <seven_seg_decode>
 40c:	006102a3          	sb	t1,5(sp)
 410:	ef9396e3          	bne	t2,s9,2fc <here>
 414:	00000c93          	li	s9,0
 418:	000c8513          	mv	a0,s9
 41c:	030c8993          	addi	s3,s9,48
 420:	0bc000ef          	jal	4dc <seven_seg_decode>
 424:	006102a3          	sb	t1,5(sp)
 428:	001d0d13          	addi	s10,s10,1
 42c:	000d0513          	mv	a0,s10
 430:	030d0e13          	addi	t3,s10,48
 434:	0a8000ef          	jal	4dc <seven_seg_decode>
 438:	00610323          	sb	t1,6(sp)
 43c:	eda210e3          	bne	tp,s10,2fc <here>
 440:	00000d13          	li	s10,0
 444:	000d0513          	mv	a0,s10
 448:	030d0e13          	addi	t3,s10,48
 44c:	090000ef          	jal	4dc <seven_seg_decode>
 450:	00610323          	sb	t1,6(sp)
 454:	001d8d93          	addi	s11,s11,1
 458:	000d8513          	mv	a0,s11
 45c:	030d8e93          	addi	t4,s11,48
 460:	07c000ef          	jal	4dc <seven_seg_decode>
 464:	006103a3          	sb	t1,7(sp)
 468:	e9b21ae3          	bne	tp,s11,2fc <here>
 46c:	00000d93          	li	s11,0
 470:	000d8513          	mv	a0,s11
 474:	030d8e93          	addi	t4,s11,48
 478:	064000ef          	jal	4dc <seven_seg_decode>
 47c:	006103a3          	sb	t1,7(sp)
 480:	e7dff06f          	j	2fc <here>

00000484 <stop>:
 484:	00008713          	mv	a4,ra
 488:	00000693          	li	a3,0

0000048c <P_WAIT>:
 48c:	00040583          	lb	a1,0(s0)
 490:	0085f613          	andi	a2,a1,8
 494:	fe061ce3          	bnez	a2,48c <P_WAIT>
 498:	15c000ef          	jal	5f4 <delay_10ms>
 49c:	158000ef          	jal	5f4 <delay_10ms>
 4a0:	00040583          	lb	a1,0(s0)
 4a4:	0085f613          	andi	a2,a1,8
 4a8:	fe0612e3          	bnez	a2,48c <P_WAIT>

000004ac <R_WAIT>:
 4ac:	00040583          	lb	a1,0(s0)
 4b0:	0085f613          	andi	a2,a1,8
 4b4:	fe060ce3          	beqz	a2,4ac <R_WAIT>
 4b8:	13c000ef          	jal	5f4 <delay_10ms>
 4bc:	138000ef          	jal	5f4 <delay_10ms>
 4c0:	00040583          	lb	a1,0(s0)
 4c4:	0085f613          	andi	a2,a1,8
 4c8:	fe0602e3          	beqz	a2,4ac <R_WAIT>
 4cc:	00069663          	bnez	a3,4d8 <run>
 4d0:	00168693          	addi	a3,a3,1
 4d4:	fb9ff06f          	j	48c <P_WAIT>

000004d8 <run>:
 4d8:	00070067          	jr	a4

000004dc <seven_seg_decode>:
 4dc:	00000293          	li	t0,0
 4e0:	08550063          	beq	a0,t0,560 <display_0>
 4e4:	00100293          	li	t0,1
 4e8:	08550063          	beq	a0,t0,568 <display_1>
 4ec:	00200293          	li	t0,2
 4f0:	08550063          	beq	a0,t0,570 <display_2>
 4f4:	00300293          	li	t0,3
 4f8:	08550063          	beq	a0,t0,578 <display_3>
 4fc:	00400293          	li	t0,4
 500:	08550063          	beq	a0,t0,580 <display_4>
 504:	00500293          	li	t0,5
 508:	08550063          	beq	a0,t0,588 <display_5>
 50c:	00600293          	li	t0,6
 510:	08550063          	beq	a0,t0,590 <display_6>
 514:	00700293          	li	t0,7
 518:	08550063          	beq	a0,t0,598 <display_7>
 51c:	00800293          	li	t0,8
 520:	08550063          	beq	a0,t0,5a0 <display_8>
 524:	00900293          	li	t0,9
 528:	08550063          	beq	a0,t0,5a8 <display_9>
 52c:	00a00293          	li	t0,10
 530:	08550063          	beq	a0,t0,5b0 <display_A>
 534:	00b00293          	li	t0,11
 538:	08550063          	beq	a0,t0,5b8 <display_B>
 53c:	00c00293          	li	t0,12
 540:	08550063          	beq	a0,t0,5c0 <display_C>
 544:	00d00293          	li	t0,13
 548:	08550063          	beq	a0,t0,5c8 <display_D>
 54c:	00e00293          	li	t0,14
 550:	08550063          	beq	a0,t0,5d0 <display_E>
 554:	00f00293          	li	t0,15
 558:	08550063          	beq	a0,t0,5d8 <display_F>
 55c:	00008067          	ret

00000560 <display_0>:
 560:	04000313          	li	t1,64
 564:	00008067          	ret

00000568 <display_1>:
 568:	07900313          	li	t1,121
 56c:	00008067          	ret

00000570 <display_2>:
 570:	02400313          	li	t1,36
 574:	00008067          	ret

00000578 <display_3>:
 578:	03000313          	li	t1,48
 57c:	00008067          	ret

00000580 <display_4>:
 580:	01900313          	li	t1,25
 584:	00008067          	ret

00000588 <display_5>:
 588:	01200313          	li	t1,18
 58c:	00008067          	ret

00000590 <display_6>:
 590:	00200313          	li	t1,2
 594:	00008067          	ret

00000598 <display_7>:
 598:	07800313          	li	t1,120
 59c:	00008067          	ret

000005a0 <display_8>:
 5a0:	00000313          	li	t1,0
 5a4:	00008067          	ret

000005a8 <display_9>:
 5a8:	01000313          	li	t1,16
 5ac:	00008067          	ret

000005b0 <display_A>:
 5b0:	00800313          	li	t1,8
 5b4:	00008067          	ret

000005b8 <display_B>:
 5b8:	00300313          	li	t1,3
 5bc:	00008067          	ret

000005c0 <display_C>:
 5c0:	04600313          	li	t1,70
 5c4:	00008067          	ret

000005c8 <display_D>:
 5c8:	02100313          	li	t1,33
 5cc:	00008067          	ret

000005d0 <display_E>:
 5d0:	00600313          	li	t1,6
 5d4:	00008067          	ret

000005d8 <display_F>:
 5d8:	00e00313          	li	t1,14
 5dc:	00008067          	ret

000005e0 <delay>:
 5e0:	003002b3          	add	t0,zero,gp

000005e4 <dloop>:
 5e4:	fff28293          	addi	t0,t0,-1
 5e8:	fe029ee3          	bnez	t0,5e4 <dloop>
 5ec:	00a00193          	li	gp,10
 5f0:	00008067          	ret

000005f4 <delay_10ms>:
 5f4:	0001f2b7          	lui	t0,0x1f
 5f8:	84828293          	addi	t0,t0,-1976 # 1e848 <delay_loop+0x1e24c>

000005fc <delay_loop>:
 5fc:	fff28293          	addi	t0,t0,-1
 600:	fe029ee3          	bnez	t0,5fc <delay_loop>
 604:	00008067          	ret
