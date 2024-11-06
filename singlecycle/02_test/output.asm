
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000013          	nop
   4:	00000013          	nop
   8:	00000013          	nop

0000000c <power_reset_lcd>:
   c:	00007137          	lui	sp,0x7
  10:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68b4>
  14:	c00001b7          	lui	gp,0xc0000
  18:	00312023          	sw	gp,0(sp)
  1c:	0001f1b7          	lui	gp,0x1f
  20:	84718193          	addi	gp,gp,-1977 # 1e847 <delay_loop+0x1e0cb>
  24:	73c000ef          	jal	760 <delay>
  28:	00000213          	li	tp,0
  2c:	03000193          	li	gp,48
  30:	0ac000ef          	jal	dc <out_lcd>
  34:	000061b7          	lui	gp,0x6
  38:	68918193          	addi	gp,gp,1673 # 6689 <delay_loop+0x5f0d>
  3c:	724000ef          	jal	760 <delay>
  40:	00000213          	li	tp,0
  44:	03000193          	li	gp,48
  48:	094000ef          	jal	dc <out_lcd>
  4c:	000031b7          	lui	gp,0x3
  50:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2957>
  54:	70c000ef          	jal	760 <delay>
  58:	00000213          	li	tp,0
  5c:	03000193          	li	gp,48
  60:	07c000ef          	jal	dc <out_lcd>
  64:	000031b7          	lui	gp,0x3
  68:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2957>
  6c:	6f4000ef          	jal	760 <delay>

00000070 <init_lcd>:
  70:	00000213          	li	tp,0
  74:	03800193          	li	gp,56
  78:	064000ef          	jal	dc <out_lcd>
  7c:	27000193          	li	gp,624
  80:	6e0000ef          	jal	760 <delay>
  84:	00000213          	li	tp,0
  88:	00100193          	li	gp,1
  8c:	050000ef          	jal	dc <out_lcd>
  90:	000031b7          	lui	gp,0x3
  94:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2957>
  98:	6c8000ef          	jal	760 <delay>
  9c:	00000213          	li	tp,0
  a0:	00c00193          	li	gp,12
  a4:	038000ef          	jal	dc <out_lcd>
  a8:	27000193          	li	gp,624
  ac:	6b4000ef          	jal	760 <delay>
  b0:	00000213          	li	tp,0
  b4:	00600193          	li	gp,6
  b8:	024000ef          	jal	dc <out_lcd>
  bc:	27000193          	li	gp,624
  c0:	6a0000ef          	jal	760 <delay>
  c4:	00000213          	li	tp,0
  c8:	08200193          	li	gp,130
  cc:	010000ef          	jal	dc <out_lcd>
  d0:	27000193          	li	gp,624
  d4:	68c000ef          	jal	760 <delay>
  d8:	1980006f          	j	270 <init_prog>

000000dc <out_lcd>:
  dc:	00008393          	mv	t2,ra
  e0:	00007137          	lui	sp,0x7
  e4:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68b4>
  e8:	000f0663          	beqz	t5,f4 <command>
  ec:	60018193          	addi	gp,gp,1536
  f0:	0080006f          	j	f8 <send>

000000f4 <command>:
  f4:	40018193          	addi	gp,gp,1024

000000f8 <send>:
  f8:	00311023          	sh	gp,0(sp)
  fc:	27000193          	li	gp,624
 100:	660000ef          	jal	760 <delay>
 104:	000110a3          	sh	zero,1(sp)
 108:	00038093          	mv	ra,t2
 10c:	00a00193          	li	gp,10
 110:	00a00213          	li	tp,10
 114:	00600393          	li	t2,6
 118:	00007137          	lui	sp,0x7
 11c:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68a4>
 120:	00008067          	ret

00000124 <lap>:
 124:	00008713          	mv	a4,ra

00000128 <P_WAIT1>:
 128:	00040583          	lb	a1,0(s0)
 12c:	0045f613          	andi	a2,a1,4
 130:	fe061ce3          	bnez	a2,128 <P_WAIT1>
 134:	640000ef          	jal	774 <delay_10ms>
 138:	63c000ef          	jal	774 <delay_10ms>
 13c:	00040583          	lb	a1,0(s0)
 140:	0045f613          	andi	a2,a1,4
 144:	fe0612e3          	bnez	a2,128 <P_WAIT1>

00000148 <R_WAIT1>:
 148:	00040583          	lb	a1,0(s0)
 14c:	0045f613          	andi	a2,a1,4
 150:	fe060ce3          	beqz	a2,148 <R_WAIT1>
 154:	620000ef          	jal	774 <delay_10ms>
 158:	61c000ef          	jal	774 <delay_10ms>
 15c:	00040583          	lb	a1,0(s0)
 160:	0045f613          	andi	a2,a1,4
 164:	fe0602e3          	beqz	a2,148 <R_WAIT1>
 168:	00100f13          	li	t5,1
 16c:	000e8193          	mv	gp,t4
 170:	f6dff0ef          	jal	dc <out_lcd>
 174:	27000193          	li	gp,624
 178:	5e8000ef          	jal	760 <delay>
 17c:	00100f13          	li	t5,1
 180:	000e0193          	mv	gp,t3
 184:	f59ff0ef          	jal	dc <out_lcd>
 188:	27000193          	li	gp,624
 18c:	5d4000ef          	jal	760 <delay>
 190:	00100f13          	li	t5,1
 194:	03a00193          	li	gp,58
 198:	f45ff0ef          	jal	dc <out_lcd>
 19c:	27000193          	li	gp,624
 1a0:	5c0000ef          	jal	760 <delay>
 1a4:	00100f13          	li	t5,1
 1a8:	00098193          	mv	gp,s3
 1ac:	f31ff0ef          	jal	dc <out_lcd>
 1b0:	27000193          	li	gp,624
 1b4:	5ac000ef          	jal	760 <delay>
 1b8:	00100f13          	li	t5,1
 1bc:	00090193          	mv	gp,s2
 1c0:	f1dff0ef          	jal	dc <out_lcd>
 1c4:	27000193          	li	gp,624
 1c8:	598000ef          	jal	760 <delay>
 1cc:	00100f13          	li	t5,1
 1d0:	03a00193          	li	gp,58
 1d4:	f09ff0ef          	jal	dc <out_lcd>
 1d8:	27000193          	li	gp,624
 1dc:	584000ef          	jal	760 <delay>
 1e0:	00100f13          	li	t5,1
 1e4:	00088193          	mv	gp,a7
 1e8:	ef5ff0ef          	jal	dc <out_lcd>
 1ec:	27000193          	li	gp,624
 1f0:	570000ef          	jal	760 <delay>
 1f4:	00100f13          	li	t5,1
 1f8:	00080193          	mv	gp,a6
 1fc:	ee1ff0ef          	jal	dc <out_lcd>
 200:	27000193          	li	gp,624
 204:	55c000ef          	jal	760 <delay>
 208:	00100f13          	li	t5,1
 20c:	03a00193          	li	gp,58
 210:	ecdff0ef          	jal	dc <out_lcd>
 214:	27000193          	li	gp,624
 218:	548000ef          	jal	760 <delay>
 21c:	00100f13          	li	t5,1
 220:	00078193          	mv	gp,a5
 224:	eb9ff0ef          	jal	dc <out_lcd>
 228:	27000193          	li	gp,624
 22c:	534000ef          	jal	760 <delay>
 230:	00100f13          	li	t5,1
 234:	00048193          	mv	gp,s1
 238:	ea5ff0ef          	jal	dc <out_lcd>
 23c:	27000193          	li	gp,624
 240:	520000ef          	jal	760 <delay>
 244:	000f9863          	bnez	t6,254 <row2>
 248:	08200193          	li	gp,130
 24c:	00100f93          	li	t6,1
 250:	00c0006f          	j	25c <movecur>

00000254 <row2>:
 254:	0c200193          	li	gp,194
 258:	00000f93          	li	t6,0

0000025c <movecur>:
 25c:	00000f13          	li	t5,0
 260:	e7dff0ef          	jal	dc <out_lcd>
 264:	27000193          	li	gp,624
 268:	4f8000ef          	jal	760 <delay>
 26c:	00070067          	jr	a4

00000270 <init_prog>:
 270:	00a00193          	li	gp,10
 274:	00a00213          	li	tp,10
 278:	00600393          	li	t2,6
 27c:	00000a13          	li	s4,0
 280:	00000a93          	li	s5,0
 284:	00000b13          	li	s6,0
 288:	00000b93          	li	s7,0
 28c:	00000c13          	li	s8,0
 290:	00000c93          	li	s9,0
 294:	00000d13          	li	s10,0
 298:	00000d93          	li	s11,0
 29c:	03000493          	li	s1,48
 2a0:	03000793          	li	a5,48
 2a4:	03000813          	li	a6,48
 2a8:	03000893          	li	a7,48
 2ac:	03000913          	li	s2,48
 2b0:	03000993          	li	s3,48
 2b4:	03000e13          	li	t3,48
 2b8:	03000e93          	li	t4,48
 2bc:	00100f93          	li	t6,1
 2c0:	00007137          	lui	sp,0x7
 2c4:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68a4>
 2c8:	00008437          	lui	s0,0x8
 2cc:	81040413          	addi	s0,s0,-2032 # 7810 <delay_loop+0x7094>
 2d0:	000a0513          	mv	a0,s4
 2d4:	388000ef          	jal	65c <seven_seg_decode>
 2d8:	00610023          	sb	t1,0(sp)
 2dc:	000a8513          	mv	a0,s5
 2e0:	37c000ef          	jal	65c <seven_seg_decode>
 2e4:	006100a3          	sb	t1,1(sp)
 2e8:	000b0513          	mv	a0,s6
 2ec:	370000ef          	jal	65c <seven_seg_decode>
 2f0:	00610123          	sb	t1,2(sp)
 2f4:	000b8513          	mv	a0,s7
 2f8:	364000ef          	jal	65c <seven_seg_decode>
 2fc:	006101a3          	sb	t1,3(sp)
 300:	000c0513          	mv	a0,s8
 304:	358000ef          	jal	65c <seven_seg_decode>
 308:	00610223          	sb	t1,4(sp)
 30c:	000c8513          	mv	a0,s9
 310:	34c000ef          	jal	65c <seven_seg_decode>
 314:	006102a3          	sb	t1,5(sp)
 318:	000d0513          	mv	a0,s10
 31c:	340000ef          	jal	65c <seven_seg_decode>
 320:	00610323          	sb	t1,6(sp)
 324:	000d8513          	mv	a0,s11
 328:	334000ef          	jal	65c <seven_seg_decode>
 32c:	006103a3          	sb	t1,7(sp)
 330:	1e00076f          	jal	a4,510 <init_start>

00000334 <here>:
 334:	00040583          	lb	a1,0(s0)
 338:	0085f613          	andi	a2,a1,8
 33c:	00061463          	bnez	a2,344 <check1>
 340:	17c000ef          	jal	4bc <stop>

00000344 <check1>:
 344:	00040583          	lb	a1,0(s0)
 348:	0045f613          	andi	a2,a1,4
 34c:	00061463          	bnez	a2,354 <skip>
 350:	dd5ff0ef          	jal	124 <lap>

00000354 <skip>:
 354:	000a0513          	mv	a0,s4
 358:	030a0493          	addi	s1,s4,48
 35c:	300000ef          	jal	65c <seven_seg_decode>
 360:	00610023          	sb	t1,0(sp)
 364:	001a0a13          	addi	s4,s4,1
 368:	40c000ef          	jal	774 <delay_10ms>
 36c:	fc3a14e3          	bne	s4,gp,334 <here>
 370:	00000a13          	li	s4,0
 374:	000a0513          	mv	a0,s4
 378:	030a0493          	addi	s1,s4,48
 37c:	2e0000ef          	jal	65c <seven_seg_decode>
 380:	00610023          	sb	t1,0(sp)
 384:	001a8a93          	addi	s5,s5,1
 388:	000a8513          	mv	a0,s5
 38c:	030a8793          	addi	a5,s5,48
 390:	2cc000ef          	jal	65c <seven_seg_decode>
 394:	006100a3          	sb	t1,1(sp)
 398:	f9521ee3          	bne	tp,s5,334 <here>
 39c:	00000a93          	li	s5,0
 3a0:	000a8513          	mv	a0,s5
 3a4:	030a8793          	addi	a5,s5,48
 3a8:	2b4000ef          	jal	65c <seven_seg_decode>
 3ac:	006100a3          	sb	t1,1(sp)
 3b0:	001b0b13          	addi	s6,s6,1
 3b4:	000b0513          	mv	a0,s6
 3b8:	030b0813          	addi	a6,s6,48
 3bc:	2a0000ef          	jal	65c <seven_seg_decode>
 3c0:	00610123          	sb	t1,2(sp)
 3c4:	f76218e3          	bne	tp,s6,334 <here>
 3c8:	00000b13          	li	s6,0
 3cc:	000b0513          	mv	a0,s6
 3d0:	030b0813          	addi	a6,s6,48
 3d4:	288000ef          	jal	65c <seven_seg_decode>
 3d8:	00610123          	sb	t1,2(sp)
 3dc:	001b8b93          	addi	s7,s7,1
 3e0:	000b8513          	mv	a0,s7
 3e4:	030b8893          	addi	a7,s7,48
 3e8:	274000ef          	jal	65c <seven_seg_decode>
 3ec:	006101a3          	sb	t1,3(sp)
 3f0:	f57392e3          	bne	t2,s7,334 <here>
 3f4:	00000b93          	li	s7,0
 3f8:	000b8513          	mv	a0,s7
 3fc:	030b8893          	addi	a7,s7,48
 400:	25c000ef          	jal	65c <seven_seg_decode>
 404:	006101a3          	sb	t1,3(sp)
 408:	001c0c13          	addi	s8,s8,1
 40c:	000c0513          	mv	a0,s8
 410:	030c0913          	addi	s2,s8,48
 414:	248000ef          	jal	65c <seven_seg_decode>
 418:	00610223          	sb	t1,4(sp)
 41c:	f1821ce3          	bne	tp,s8,334 <here>
 420:	00000c13          	li	s8,0
 424:	000c0513          	mv	a0,s8
 428:	030c0913          	addi	s2,s8,48
 42c:	230000ef          	jal	65c <seven_seg_decode>
 430:	00610223          	sb	t1,4(sp)
 434:	001c8c93          	addi	s9,s9,1
 438:	000c8513          	mv	a0,s9
 43c:	030c8993          	addi	s3,s9,48
 440:	21c000ef          	jal	65c <seven_seg_decode>
 444:	006102a3          	sb	t1,5(sp)
 448:	ef9396e3          	bne	t2,s9,334 <here>
 44c:	00000c93          	li	s9,0
 450:	000c8513          	mv	a0,s9
 454:	030c8993          	addi	s3,s9,48
 458:	204000ef          	jal	65c <seven_seg_decode>
 45c:	006102a3          	sb	t1,5(sp)
 460:	001d0d13          	addi	s10,s10,1
 464:	000d0513          	mv	a0,s10
 468:	030d0e13          	addi	t3,s10,48
 46c:	1f0000ef          	jal	65c <seven_seg_decode>
 470:	00610323          	sb	t1,6(sp)
 474:	eda210e3          	bne	tp,s10,334 <here>
 478:	00000d13          	li	s10,0
 47c:	000d0513          	mv	a0,s10
 480:	030d0e13          	addi	t3,s10,48
 484:	1d8000ef          	jal	65c <seven_seg_decode>
 488:	00610323          	sb	t1,6(sp)
 48c:	001d8d93          	addi	s11,s11,1
 490:	000d8513          	mv	a0,s11
 494:	030d8e93          	addi	t4,s11,48
 498:	1c4000ef          	jal	65c <seven_seg_decode>
 49c:	006103a3          	sb	t1,7(sp)
 4a0:	e9b21ae3          	bne	tp,s11,334 <here>
 4a4:	00000d93          	li	s11,0
 4a8:	000d8513          	mv	a0,s11
 4ac:	030d8e93          	addi	t4,s11,48
 4b0:	1ac000ef          	jal	65c <seven_seg_decode>
 4b4:	006103a3          	sb	t1,7(sp)
 4b8:	e7dff06f          	j	334 <here>

000004bc <stop>:
 4bc:	00008713          	mv	a4,ra
 4c0:	00000693          	li	a3,0

000004c4 <P_WAIT>:
 4c4:	00040583          	lb	a1,0(s0)
 4c8:	0025f613          	andi	a2,a1,2
 4cc:	00061463          	bnez	a2,4d4 <cont>
 4d0:	050000ef          	jal	520 <reset>

000004d4 <cont>:
 4d4:	0085f613          	andi	a2,a1,8
 4d8:	fe0616e3          	bnez	a2,4c4 <P_WAIT>
 4dc:	298000ef          	jal	774 <delay_10ms>
 4e0:	294000ef          	jal	774 <delay_10ms>
 4e4:	00040583          	lb	a1,0(s0)
 4e8:	0085f613          	andi	a2,a1,8
 4ec:	fc061ce3          	bnez	a2,4c4 <P_WAIT>

000004f0 <R_WAIT>:
 4f0:	00040583          	lb	a1,0(s0)
 4f4:	0085f613          	andi	a2,a1,8
 4f8:	fe060ce3          	beqz	a2,4f0 <R_WAIT>
 4fc:	278000ef          	jal	774 <delay_10ms>
 500:	274000ef          	jal	774 <delay_10ms>
 504:	00040583          	lb	a1,0(s0)
 508:	0085f613          	andi	a2,a1,8
 50c:	fe0602e3          	beqz	a2,4f0 <R_WAIT>

00000510 <init_start>:
 510:	00069663          	bnez	a3,51c <run>
 514:	00168693          	addi	a3,a3,1
 518:	fadff06f          	j	4c4 <P_WAIT>

0000051c <run>:
 51c:	00070067          	jr	a4

00000520 <reset>:
 520:	00002137          	lui	sp,0x2
 524:	10010113          	addi	sp,sp,256 # 2100 <delay_loop+0x1984>
 528:	00112023          	sw	ra,0(sp)

0000052c <P_WAIT2>:
 52c:	00040583          	lb	a1,0(s0)
 530:	0025f613          	andi	a2,a1,2
 534:	fe061ce3          	bnez	a2,52c <P_WAIT2>
 538:	23c000ef          	jal	774 <delay_10ms>
 53c:	238000ef          	jal	774 <delay_10ms>
 540:	00040583          	lb	a1,0(s0)
 544:	0025f613          	andi	a2,a1,2
 548:	fe0612e3          	bnez	a2,52c <P_WAIT2>

0000054c <R_WAIT2>:
 54c:	00040583          	lb	a1,0(s0)
 550:	0025f613          	andi	a2,a1,2
 554:	fe060ce3          	beqz	a2,54c <R_WAIT2>
 558:	21c000ef          	jal	774 <delay_10ms>
 55c:	218000ef          	jal	774 <delay_10ms>
 560:	00040583          	lb	a1,0(s0)
 564:	0025f613          	andi	a2,a1,2
 568:	fe0602e3          	beqz	a2,54c <R_WAIT2>
 56c:	00000a13          	li	s4,0
 570:	00000a93          	li	s5,0
 574:	00000b13          	li	s6,0
 578:	00000b93          	li	s7,0
 57c:	00000c13          	li	s8,0
 580:	00000c93          	li	s9,0
 584:	00000d13          	li	s10,0
 588:	00000d93          	li	s11,0
 58c:	00007137          	lui	sp,0x7
 590:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68a4>
 594:	000a0513          	mv	a0,s4
 598:	0c4000ef          	jal	65c <seven_seg_decode>
 59c:	00610023          	sb	t1,0(sp)
 5a0:	000a8513          	mv	a0,s5
 5a4:	0b8000ef          	jal	65c <seven_seg_decode>
 5a8:	006100a3          	sb	t1,1(sp)
 5ac:	000b0513          	mv	a0,s6
 5b0:	0ac000ef          	jal	65c <seven_seg_decode>
 5b4:	00610123          	sb	t1,2(sp)
 5b8:	000b8513          	mv	a0,s7
 5bc:	0a0000ef          	jal	65c <seven_seg_decode>
 5c0:	006101a3          	sb	t1,3(sp)
 5c4:	000c0513          	mv	a0,s8
 5c8:	094000ef          	jal	65c <seven_seg_decode>
 5cc:	00610223          	sb	t1,4(sp)
 5d0:	000c8513          	mv	a0,s9
 5d4:	088000ef          	jal	65c <seven_seg_decode>
 5d8:	006102a3          	sb	t1,5(sp)
 5dc:	000d0513          	mv	a0,s10
 5e0:	07c000ef          	jal	65c <seven_seg_decode>
 5e4:	00610323          	sb	t1,6(sp)
 5e8:	000d8513          	mv	a0,s11
 5ec:	070000ef          	jal	65c <seven_seg_decode>
 5f0:	006103a3          	sb	t1,7(sp)
 5f4:	00000213          	li	tp,0
 5f8:	00100193          	li	gp,1
 5fc:	ae1ff0ef          	jal	dc <out_lcd>
 600:	000031b7          	lui	gp,0x3
 604:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2957>
 608:	158000ef          	jal	760 <delay>
 60c:	00000213          	li	tp,0
 610:	08200193          	li	gp,130
 614:	ac9ff0ef          	jal	dc <out_lcd>
 618:	27000193          	li	gp,624
 61c:	144000ef          	jal	760 <delay>
 620:	03000493          	li	s1,48
 624:	03000793          	li	a5,48
 628:	03000813          	li	a6,48
 62c:	03000893          	li	a7,48
 630:	03000913          	li	s2,48
 634:	03000993          	li	s3,48
 638:	03000e13          	li	t3,48
 63c:	03000e93          	li	t4,48
 640:	00100f93          	li	t6,1
 644:	00002137          	lui	sp,0x2
 648:	10010113          	addi	sp,sp,256 # 2100 <delay_loop+0x1984>
 64c:	00012083          	lw	ra,0(sp)
 650:	00007137          	lui	sp,0x7
 654:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68a4>
 658:	00008067          	ret

0000065c <seven_seg_decode>:
 65c:	00000293          	li	t0,0
 660:	08550063          	beq	a0,t0,6e0 <display_0>
 664:	00100293          	li	t0,1
 668:	08550063          	beq	a0,t0,6e8 <display_1>
 66c:	00200293          	li	t0,2
 670:	08550063          	beq	a0,t0,6f0 <display_2>
 674:	00300293          	li	t0,3
 678:	08550063          	beq	a0,t0,6f8 <display_3>
 67c:	00400293          	li	t0,4
 680:	08550063          	beq	a0,t0,700 <display_4>
 684:	00500293          	li	t0,5
 688:	08550063          	beq	a0,t0,708 <display_5>
 68c:	00600293          	li	t0,6
 690:	08550063          	beq	a0,t0,710 <display_6>
 694:	00700293          	li	t0,7
 698:	08550063          	beq	a0,t0,718 <display_7>
 69c:	00800293          	li	t0,8
 6a0:	08550063          	beq	a0,t0,720 <display_8>
 6a4:	00900293          	li	t0,9
 6a8:	08550063          	beq	a0,t0,728 <display_9>
 6ac:	00a00293          	li	t0,10
 6b0:	08550063          	beq	a0,t0,730 <display_A>
 6b4:	00b00293          	li	t0,11
 6b8:	08550063          	beq	a0,t0,738 <display_B>
 6bc:	00c00293          	li	t0,12
 6c0:	08550063          	beq	a0,t0,740 <display_C>
 6c4:	00d00293          	li	t0,13
 6c8:	08550063          	beq	a0,t0,748 <display_D>
 6cc:	00e00293          	li	t0,14
 6d0:	08550063          	beq	a0,t0,750 <display_E>
 6d4:	00f00293          	li	t0,15
 6d8:	08550063          	beq	a0,t0,758 <display_F>
 6dc:	00008067          	ret

000006e0 <display_0>:
 6e0:	04000313          	li	t1,64
 6e4:	00008067          	ret

000006e8 <display_1>:
 6e8:	07900313          	li	t1,121
 6ec:	00008067          	ret

000006f0 <display_2>:
 6f0:	02400313          	li	t1,36
 6f4:	00008067          	ret

000006f8 <display_3>:
 6f8:	03000313          	li	t1,48
 6fc:	00008067          	ret

00000700 <display_4>:
 700:	01900313          	li	t1,25
 704:	00008067          	ret

00000708 <display_5>:
 708:	01200313          	li	t1,18
 70c:	00008067          	ret

00000710 <display_6>:
 710:	00200313          	li	t1,2
 714:	00008067          	ret

00000718 <display_7>:
 718:	07800313          	li	t1,120
 71c:	00008067          	ret

00000720 <display_8>:
 720:	00000313          	li	t1,0
 724:	00008067          	ret

00000728 <display_9>:
 728:	01000313          	li	t1,16
 72c:	00008067          	ret

00000730 <display_A>:
 730:	00800313          	li	t1,8
 734:	00008067          	ret

00000738 <display_B>:
 738:	00300313          	li	t1,3
 73c:	00008067          	ret

00000740 <display_C>:
 740:	04600313          	li	t1,70
 744:	00008067          	ret

00000748 <display_D>:
 748:	02100313          	li	t1,33
 74c:	00008067          	ret

00000750 <display_E>:
 750:	00600313          	li	t1,6
 754:	00008067          	ret

00000758 <display_F>:
 758:	00e00313          	li	t1,14
 75c:	00008067          	ret

00000760 <delay>:
 760:	003002b3          	add	t0,zero,gp

00000764 <dloop>:
 764:	fff28293          	addi	t0,t0,-1
 768:	fe029ee3          	bnez	t0,764 <dloop>
 76c:	00a00193          	li	gp,10
 770:	00008067          	ret

00000774 <delay_10ms>:
 774:	0000f2b7          	lui	t0,0xf
 778:	42428293          	addi	t0,t0,1060 # f424 <delay_loop+0xeca8>

0000077c <delay_loop>:
 77c:	fff28293          	addi	t0,t0,-1
 780:	fe029ee3          	bnez	t0,77c <delay_loop>
 784:	00008067          	ret
