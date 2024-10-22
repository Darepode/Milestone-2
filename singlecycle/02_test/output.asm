
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00007137          	lui	sp,0x7
   4:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x6df8>
   8:	00a00193          	li	gp,10
   c:	00900213          	li	tp,9
  10:	00500393          	li	t2,5
  14:	00000a13          	li	s4,0
  18:	00000a93          	li	s5,0
  1c:	00000b13          	li	s6,0
  20:	00000b93          	li	s7,0
  24:	00000c13          	li	s8,0
  28:	00000c93          	li	s9,0
  2c:	00000d13          	li	s10,0
  30:	00000d93          	li	s11,0
  34:	01410023          	sb	s4,0(sp)
  38:	015100a3          	sb	s5,1(sp)
  3c:	01610123          	sb	s6,2(sp)
  40:	017101a3          	sb	s7,3(sp)
  44:	01810223          	sb	s8,4(sp)
  48:	019102a3          	sb	s9,5(sp)
  4c:	01a10323          	sb	s10,6(sp)
  50:	01b103a3          	sb	s11,7(sp)

00000054 <here>:
  54:	000a0513          	mv	a0,s4
  58:	0c4000ef          	jal	11c <seven_seg_decode>
  5c:	00610023          	sb	t1,0(sp)
  60:	1c0000ef          	jal	220 <delay_10ms>
  64:	001a0a13          	addi	s4,s4,1
  68:	fe3a16e3          	bne	s4,gp,54 <here>
  6c:	00000a13          	li	s4,0
  70:	001a8a93          	addi	s5,s5,1
  74:	000a8513          	mv	a0,s5
  78:	0a4000ef          	jal	11c <seven_seg_decode>
  7c:	006100a3          	sb	t1,1(sp)
  80:	fd521ae3          	bne	tp,s5,54 <here>
  84:	00000a93          	li	s5,0
  88:	001b0b13          	addi	s6,s6,1
  8c:	000b0513          	mv	a0,s6
  90:	08c000ef          	jal	11c <seven_seg_decode>
  94:	00610123          	sb	t1,2(sp)
  98:	fb621ee3          	bne	tp,s6,54 <here>
  9c:	00000b13          	li	s6,0
  a0:	001b8b93          	addi	s7,s7,1
  a4:	000b8513          	mv	a0,s7
  a8:	074000ef          	jal	11c <seven_seg_decode>
  ac:	006101a3          	sb	t1,3(sp)
  b0:	fb7392e3          	bne	t2,s7,54 <here>
  b4:	00000b93          	li	s7,0
  b8:	001c0c13          	addi	s8,s8,1
  bc:	000c0513          	mv	a0,s8
  c0:	05c000ef          	jal	11c <seven_seg_decode>
  c4:	00610223          	sb	t1,4(sp)
  c8:	f98216e3          	bne	tp,s8,54 <here>
  cc:	00000c13          	li	s8,0
  d0:	001c8c93          	addi	s9,s9,1
  d4:	000c8513          	mv	a0,s9
  d8:	044000ef          	jal	11c <seven_seg_decode>
  dc:	006102a3          	sb	t1,5(sp)
  e0:	f7939ae3          	bne	t2,s9,54 <here>
  e4:	00000c93          	li	s9,0
  e8:	001d0d13          	addi	s10,s10,1
  ec:	000d0513          	mv	a0,s10
  f0:	02c000ef          	jal	11c <seven_seg_decode>
  f4:	00610323          	sb	t1,6(sp)
  f8:	f5a21ee3          	bne	tp,s10,54 <here>
  fc:	00000d13          	li	s10,0
 100:	001d8d93          	addi	s11,s11,1
 104:	000d8513          	mv	a0,s11
 108:	014000ef          	jal	11c <seven_seg_decode>
 10c:	006103a3          	sb	t1,7(sp)
 110:	f5b212e3          	bne	tp,s11,54 <here>
 114:	00000d93          	li	s11,0
 118:	f3dff06f          	j	54 <here>

0000011c <seven_seg_decode>:
 11c:	00000293          	li	t0,0
 120:	08550063          	beq	a0,t0,1a0 <display_0>
 124:	00100293          	li	t0,1
 128:	08550063          	beq	a0,t0,1a8 <display_1>
 12c:	00200293          	li	t0,2
 130:	08550063          	beq	a0,t0,1b0 <display_2>
 134:	00300293          	li	t0,3
 138:	08550063          	beq	a0,t0,1b8 <display_3>
 13c:	00400293          	li	t0,4
 140:	08550063          	beq	a0,t0,1c0 <display_4>
 144:	00500293          	li	t0,5
 148:	08550063          	beq	a0,t0,1c8 <display_5>
 14c:	00600293          	li	t0,6
 150:	08550063          	beq	a0,t0,1d0 <display_6>
 154:	00700293          	li	t0,7
 158:	08550063          	beq	a0,t0,1d8 <display_7>
 15c:	00800293          	li	t0,8
 160:	08550063          	beq	a0,t0,1e0 <display_8>
 164:	00900293          	li	t0,9
 168:	08550063          	beq	a0,t0,1e8 <display_9>
 16c:	00a00293          	li	t0,10
 170:	08550063          	beq	a0,t0,1f0 <display_A>
 174:	00b00293          	li	t0,11
 178:	08550063          	beq	a0,t0,1f8 <display_B>
 17c:	00c00293          	li	t0,12
 180:	08550063          	beq	a0,t0,200 <display_C>
 184:	00d00293          	li	t0,13
 188:	08550063          	beq	a0,t0,208 <display_D>
 18c:	00e00293          	li	t0,14
 190:	08550063          	beq	a0,t0,210 <display_E>
 194:	00f00293          	li	t0,15
 198:	08550063          	beq	a0,t0,218 <display_F>
 19c:	00008067          	ret

000001a0 <display_0>:
 1a0:	04000313          	li	t1,64
 1a4:	00008067          	ret

000001a8 <display_1>:
 1a8:	07900313          	li	t1,121
 1ac:	00008067          	ret

000001b0 <display_2>:
 1b0:	02400313          	li	t1,36
 1b4:	00008067          	ret

000001b8 <display_3>:
 1b8:	03000313          	li	t1,48
 1bc:	00008067          	ret

000001c0 <display_4>:
 1c0:	01900313          	li	t1,25
 1c4:	00008067          	ret

000001c8 <display_5>:
 1c8:	01200313          	li	t1,18
 1cc:	00008067          	ret

000001d0 <display_6>:
 1d0:	00200313          	li	t1,2
 1d4:	00008067          	ret

000001d8 <display_7>:
 1d8:	07800313          	li	t1,120
 1dc:	00008067          	ret

000001e0 <display_8>:
 1e0:	00000313          	li	t1,0
 1e4:	00008067          	ret

000001e8 <display_9>:
 1e8:	01000313          	li	t1,16
 1ec:	00008067          	ret

000001f0 <display_A>:
 1f0:	00800313          	li	t1,8
 1f4:	00008067          	ret

000001f8 <display_B>:
 1f8:	00300313          	li	t1,3
 1fc:	00008067          	ret

00000200 <display_C>:
 200:	04600313          	li	t1,70
 204:	00008067          	ret

00000208 <display_D>:
 208:	02100313          	li	t1,33
 20c:	00008067          	ret

00000210 <display_E>:
 210:	00600313          	li	t1,6
 214:	00008067          	ret

00000218 <display_F>:
 218:	00e00313          	li	t1,14
 21c:	00008067          	ret

00000220 <delay_10ms>:
 220:	000032b7          	lui	t0,0x3
 224:	0d328293          	addi	t0,t0,211 # 30d3 <delay_loop+0x2eab>

00000228 <delay_loop>:
 228:	fff28293          	addi	t0,t0,-1
 22c:	fe029ee3          	bnez	t0,228 <delay_loop>
 230:	00008067          	ret
