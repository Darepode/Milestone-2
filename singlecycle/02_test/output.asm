
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00007137          	lui	sp,0x7
   4:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x6d58>
   8:	00a00193          	li	gp,10
   c:	00a00213          	li	tp,10
  10:	00600393          	li	t2,6
  14:	00000a13          	li	s4,0
  18:	00100a93          	li	s5,1
  1c:	00200b13          	li	s6,2
  20:	00300b93          	li	s7,3
  24:	00400c13          	li	s8,4
  28:	00500c93          	li	s9,5
  2c:	00600d13          	li	s10,6
  30:	00700d93          	li	s11,7
  34:	000a0513          	mv	a0,s4
  38:	184000ef          	jal	1bc <seven_seg_decode>
  3c:	00610023          	sb	t1,0(sp)
  40:	000a8513          	mv	a0,s5
  44:	178000ef          	jal	1bc <seven_seg_decode>
  48:	006100a3          	sb	t1,1(sp)
  4c:	000b0513          	mv	a0,s6
  50:	16c000ef          	jal	1bc <seven_seg_decode>
  54:	00610123          	sb	t1,2(sp)
  58:	000b8513          	mv	a0,s7
  5c:	160000ef          	jal	1bc <seven_seg_decode>
  60:	006101a3          	sb	t1,3(sp)
  64:	000c0513          	mv	a0,s8
  68:	154000ef          	jal	1bc <seven_seg_decode>
  6c:	00610223          	sb	t1,4(sp)
  70:	000c8513          	mv	a0,s9
  74:	148000ef          	jal	1bc <seven_seg_decode>
  78:	006102a3          	sb	t1,5(sp)
  7c:	000d0513          	mv	a0,s10
  80:	13c000ef          	jal	1bc <seven_seg_decode>
  84:	00610323          	sb	t1,6(sp)
  88:	000d8513          	mv	a0,s11
  8c:	130000ef          	jal	1bc <seven_seg_decode>
  90:	006103a3          	sb	t1,7(sp)

00000094 <here>:
  94:	000a0513          	mv	a0,s4
  98:	124000ef          	jal	1bc <seven_seg_decode>
  9c:	00610023          	sb	t1,0(sp)
  a0:	001a0a13          	addi	s4,s4,1
  a4:	21c000ef          	jal	2c0 <delay_10ms>
  a8:	fe3a16e3          	bne	s4,gp,94 <here>
  ac:	00000a13          	li	s4,0
  b0:	000a0513          	mv	a0,s4
  b4:	108000ef          	jal	1bc <seven_seg_decode>
  b8:	00610023          	sb	t1,0(sp)
  bc:	001a8a93          	addi	s5,s5,1
  c0:	000a8513          	mv	a0,s5
  c4:	0f8000ef          	jal	1bc <seven_seg_decode>
  c8:	006100a3          	sb	t1,1(sp)
  cc:	fd5214e3          	bne	tp,s5,94 <here>
  d0:	00000a93          	li	s5,0
  d4:	000a8513          	mv	a0,s5
  d8:	0e4000ef          	jal	1bc <seven_seg_decode>
  dc:	006100a3          	sb	t1,1(sp)
  e0:	001b0b13          	addi	s6,s6,1
  e4:	000b0513          	mv	a0,s6
  e8:	0d4000ef          	jal	1bc <seven_seg_decode>
  ec:	00610123          	sb	t1,2(sp)
  f0:	fb6212e3          	bne	tp,s6,94 <here>
  f4:	00000b13          	li	s6,0
  f8:	000b0513          	mv	a0,s6
  fc:	0c0000ef          	jal	1bc <seven_seg_decode>
 100:	00610123          	sb	t1,2(sp)
 104:	001b8b93          	addi	s7,s7,1
 108:	000b8513          	mv	a0,s7
 10c:	0b0000ef          	jal	1bc <seven_seg_decode>
 110:	006101a3          	sb	t1,3(sp)
 114:	f97390e3          	bne	t2,s7,94 <here>
 118:	00000b93          	li	s7,0
 11c:	000b8513          	mv	a0,s7
 120:	09c000ef          	jal	1bc <seven_seg_decode>
 124:	006101a3          	sb	t1,3(sp)
 128:	001c0c13          	addi	s8,s8,1
 12c:	000c0513          	mv	a0,s8
 130:	08c000ef          	jal	1bc <seven_seg_decode>
 134:	00610223          	sb	t1,4(sp)
 138:	f5821ee3          	bne	tp,s8,94 <here>
 13c:	00000c13          	li	s8,0
 140:	000c0513          	mv	a0,s8
 144:	078000ef          	jal	1bc <seven_seg_decode>
 148:	00610223          	sb	t1,4(sp)
 14c:	001c8c93          	addi	s9,s9,1
 150:	000c8513          	mv	a0,s9
 154:	068000ef          	jal	1bc <seven_seg_decode>
 158:	006102a3          	sb	t1,5(sp)
 15c:	f3939ce3          	bne	t2,s9,94 <here>
 160:	00000c93          	li	s9,0
 164:	000c8513          	mv	a0,s9
 168:	054000ef          	jal	1bc <seven_seg_decode>
 16c:	006102a3          	sb	t1,5(sp)
 170:	001d0d13          	addi	s10,s10,1
 174:	000d0513          	mv	a0,s10
 178:	044000ef          	jal	1bc <seven_seg_decode>
 17c:	00610323          	sb	t1,6(sp)
 180:	f1a21ae3          	bne	tp,s10,94 <here>
 184:	00000d13          	li	s10,0
 188:	000d0513          	mv	a0,s10
 18c:	030000ef          	jal	1bc <seven_seg_decode>
 190:	00610323          	sb	t1,6(sp)
 194:	001d8d93          	addi	s11,s11,1
 198:	000d8513          	mv	a0,s11
 19c:	020000ef          	jal	1bc <seven_seg_decode>
 1a0:	006103a3          	sb	t1,7(sp)
 1a4:	efb218e3          	bne	tp,s11,94 <here>
 1a8:	00000d93          	li	s11,0
 1ac:	000d8513          	mv	a0,s11
 1b0:	00c000ef          	jal	1bc <seven_seg_decode>
 1b4:	006103a3          	sb	t1,7(sp)
 1b8:	eddff06f          	j	94 <here>

000001bc <seven_seg_decode>:
 1bc:	00000293          	li	t0,0
 1c0:	08550063          	beq	a0,t0,240 <display_0>
 1c4:	00100293          	li	t0,1
 1c8:	08550063          	beq	a0,t0,248 <display_1>
 1cc:	00200293          	li	t0,2
 1d0:	08550063          	beq	a0,t0,250 <display_2>
 1d4:	00300293          	li	t0,3
 1d8:	08550063          	beq	a0,t0,258 <display_3>
 1dc:	00400293          	li	t0,4
 1e0:	08550063          	beq	a0,t0,260 <display_4>
 1e4:	00500293          	li	t0,5
 1e8:	08550063          	beq	a0,t0,268 <display_5>
 1ec:	00600293          	li	t0,6
 1f0:	08550063          	beq	a0,t0,270 <display_6>
 1f4:	00700293          	li	t0,7
 1f8:	08550063          	beq	a0,t0,278 <display_7>
 1fc:	00800293          	li	t0,8
 200:	08550063          	beq	a0,t0,280 <display_8>
 204:	00900293          	li	t0,9
 208:	08550063          	beq	a0,t0,288 <display_9>
 20c:	00a00293          	li	t0,10
 210:	08550063          	beq	a0,t0,290 <display_A>
 214:	00b00293          	li	t0,11
 218:	08550063          	beq	a0,t0,298 <display_B>
 21c:	00c00293          	li	t0,12
 220:	08550063          	beq	a0,t0,2a0 <display_C>
 224:	00d00293          	li	t0,13
 228:	08550063          	beq	a0,t0,2a8 <display_D>
 22c:	00e00293          	li	t0,14
 230:	08550063          	beq	a0,t0,2b0 <display_E>
 234:	00f00293          	li	t0,15
 238:	08550063          	beq	a0,t0,2b8 <display_F>
 23c:	00008067          	ret

00000240 <display_0>:
 240:	04000313          	li	t1,64
 244:	00008067          	ret

00000248 <display_1>:
 248:	07900313          	li	t1,121
 24c:	00008067          	ret

00000250 <display_2>:
 250:	02400313          	li	t1,36
 254:	00008067          	ret

00000258 <display_3>:
 258:	03000313          	li	t1,48
 25c:	00008067          	ret

00000260 <display_4>:
 260:	01900313          	li	t1,25
 264:	00008067          	ret

00000268 <display_5>:
 268:	01200313          	li	t1,18
 26c:	00008067          	ret

00000270 <display_6>:
 270:	00200313          	li	t1,2
 274:	00008067          	ret

00000278 <display_7>:
 278:	07800313          	li	t1,120
 27c:	00008067          	ret

00000280 <display_8>:
 280:	00000313          	li	t1,0
 284:	00008067          	ret

00000288 <display_9>:
 288:	01000313          	li	t1,16
 28c:	00008067          	ret

00000290 <display_A>:
 290:	00800313          	li	t1,8
 294:	00008067          	ret

00000298 <display_B>:
 298:	00300313          	li	t1,3
 29c:	00008067          	ret

000002a0 <display_C>:
 2a0:	04600313          	li	t1,70
 2a4:	00008067          	ret

000002a8 <display_D>:
 2a8:	02100313          	li	t1,33
 2ac:	00008067          	ret

000002b0 <display_E>:
 2b0:	00600313          	li	t1,6
 2b4:	00008067          	ret

000002b8 <display_F>:
 2b8:	00e00313          	li	t1,14
 2bc:	00008067          	ret

000002c0 <delay_10ms>:
 2c0:	001312b7          	lui	t0,0x131
 2c4:	2d028293          	addi	t0,t0,720 # 1312d0 <delay_loop+0x131008>

000002c8 <delay_loop>:
 2c8:	fff28293          	addi	t0,t0,-1
 2cc:	fe029ee3          	bnez	t0,2c8 <delay_loop>
 2d0:	00008067          	ret
