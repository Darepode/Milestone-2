
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00f00093          	li	ra,15
   4:	ff100113          	li	sp,-15
   8:	01000193          	li	gp,16
   c:	0ff00213          	li	tp,255
  10:	800002b7          	lui	t0,0x80000
  14:	fff28293          	addi	t0,t0,-1 # 7fffffff <end_of_test+0x7ffffe5f>
  18:	80000337          	lui	t1,0x80000
  1c:	003083b3          	add	t2,ra,gp
  20:	00410433          	add	s0,sp,tp
  24:	006284b3          	add	s1,t0,t1
  28:	40118533          	sub	a0,gp,ra
  2c:	402205b3          	sub	a1,tp,sp
  30:	0ff0f613          	zext.b	a2,ra
  34:	0ff0e693          	ori	a3,ra,255
  38:	0ff0c713          	xori	a4,ra,255
  3c:	0100a793          	slti	a5,ra,16
  40:	00f1a813          	slti	a6,gp,15
  44:	fff1a813          	slti	a6,gp,-1
  48:	ffe00193          	li	gp,-2
  4c:	fff1a813          	slti	a6,gp,-1
  50:	0100b893          	sltiu	a7,ra,16
  54:	00100293          	li	t0,1
  58:	8002b913          	sltiu	s2,t0,-2048
  5c:	101010b7          	lui	ra,0x10101
  60:	01008093          	addi	ra,ra,16 # 10101010 <end_of_test+0x10100e70>
  64:	c0100f37          	lui	t5,0xc0100
  68:	eeef0f13          	addi	t5,t5,-274 # c00ffeee <end_of_test+0xc00ffd4e>
  6c:	02310f33          	mul	t5,sp,gp
  70:	00108663          	beq	ra,ra,7c <label_eq>
  74:	deadcfb7          	lui	t6,0xdeadc
  78:	ee1f8f93          	addi	t6,t6,-287 # deadbee1 <end_of_test+0xdeadbd41>

0000007c <label_eq>:
  7c:	80000a37          	lui	s4,0x80000
  80:	fffa0a13          	addi	s4,s4,-1 # 7fffffff <end_of_test+0x7ffffe5f>
  84:	00002ab7          	lui	s5,0x2
  88:	014aa023          	sw	s4,0(s5) # 2000 <end_of_test+0x1e60>
  8c:	0000ba37          	lui	s4,0xb
  90:	aaaa0a13          	addi	s4,s4,-1366 # aaaa <end_of_test+0xa90a>
  94:	014a9223          	sh	s4,4(s5)
  98:	014a8423          	sb	s4,8(s5)
  9c:	77710a37          	lui	s4,0x77710
  a0:	fffa0a13          	addi	s4,s4,-1 # 7770ffff <end_of_test+0x7770fe5f>
  a4:	014aa623          	sw	s4,12(s5)
  a8:	00caab03          	lw	s6,12(s5)
  ac:	00ca9b83          	lh	s7,12(s5)
  b0:	00ca8c03          	lb	s8,12(s5)
  b4:	1111ba37          	lui	s4,0x1111b
  b8:	aaaa0a13          	addi	s4,s4,-1366 # 1111aaaa <end_of_test+0x1111a90a>
  bc:	014aa823          	sw	s4,16(s5)
  c0:	010adc83          	lhu	s9,16(s5)
  c4:	010acd03          	lbu	s10,16(s5)
  c8:	00007ab7          	lui	s5,0x7
  cc:	a0a0aa37          	lui	s4,0xa0a0a
  d0:	0a0a0a13          	addi	s4,s4,160 # a0a0a0a0 <end_of_test+0xa0a09f00>
  d4:	014aa023          	sw	s4,0(s5) # 7000 <end_of_test+0x6e60>
  d8:	014a9423          	sh	s4,8(s5)
  dc:	014a8823          	sb	s4,16(s5)
  e0:	00007ab7          	lui	s5,0x7
  e4:	020a8a93          	addi	s5,s5,32 # 7020 <end_of_test+0x6e80>
  e8:	a0a0aa37          	lui	s4,0xa0a0a
  ec:	0a0a0a13          	addi	s4,s4,160 # a0a0a0a0 <end_of_test+0xa0a09f00>
  f0:	014a8023          	sb	s4,0(s5)
  f4:	00007ab7          	lui	s5,0x7
  f8:	020a8a93          	addi	s5,s5,32 # 7020 <end_of_test+0x6e80>
  fc:	07c00a13          	li	s4,124
 100:	014a80a3          	sb	s4,1(s5)
 104:	00007ab7          	lui	s5,0x7
 108:	020a8a93          	addi	s5,s5,32 # 7020 <end_of_test+0x6e80>
 10c:	a0a00a37          	lui	s4,0xa0a00
 110:	05ea0a13          	addi	s4,s4,94 # a0a0005e <end_of_test+0xa09ffebe>
 114:	014a8123          	sb	s4,2(s5)
 118:	00007ab7          	lui	s5,0x7
 11c:	020a8a93          	addi	s5,s5,32 # 7020 <end_of_test+0x6e80>
 120:	12340a37          	lui	s4,0x12340
 124:	08ba0a13          	addi	s4,s4,139 # 1234008b <end_of_test+0x1233feeb>
 128:	014a81a3          	sb	s4,3(s5)
 12c:	014a8923          	sb	s4,18(s5)
 130:	0c100fb7          	lui	t6,0xc100
 134:	ee1f8f93          	addi	t6,t6,-287 # c0ffee1 <end_of_test+0xc0ffd41>
 138:	00209663          	bne	ra,sp,144 <label_ne>
 13c:	deadcfb7          	lui	t6,0xdeadc
 140:	ee2f8f93          	addi	t6,t6,-286 # deadbee2 <end_of_test+0xdeadbd42>

00000144 <label_ne>:
 144:	0c100fb7          	lui	t6,0xc100
 148:	ee2f8f93          	addi	t6,t6,-286 # c0ffee2 <end_of_test+0xc0ffd42>
 14c:	0030c663          	blt	ra,gp,158 <label_lt>
 150:	deadcfb7          	lui	t6,0xdeadc
 154:	ee3f8f93          	addi	t6,t6,-285 # deadbee3 <end_of_test+0xdeadbd43>

00000158 <label_lt>:
 158:	0c100fb7          	lui	t6,0xc100
 15c:	ee3f8f93          	addi	t6,t6,-285 # c0ffee3 <end_of_test+0xc0ffd43>
 160:	0011d663          	bge	gp,ra,16c <label_ge>
 164:	deadcfb7          	lui	t6,0xdeadc
 168:	ee4f8f93          	addi	t6,t6,-284 # deadbee4 <end_of_test+0xdeadbd44>

0000016c <label_ge>:
 16c:	0c100fb7          	lui	t6,0xc100
 170:	ee4f8f93          	addi	t6,t6,-284 # c0ffee4 <end_of_test+0xc0ffd44>
 174:	00c00f6f          	jal	t5,180 <label_jump>
 178:	deadcfb7          	lui	t6,0xdeadc
 17c:	ee5f8f93          	addi	t6,t6,-283 # deadbee5 <end_of_test+0xdeadbd45>

00000180 <label_jump>:
 180:	0c100fb7          	lui	t6,0xc100
 184:	ee5f8f93          	addi	t6,t6,-283 # c0ffee5 <end_of_test+0xc0ffd45>
 188:	00000117          	auipc	sp,0x0
 18c:	01410113          	addi	sp,sp,20 # 19c <label_jump+0x1c>
 190:	00010f67          	jalr	t5,sp
 194:	deadcfb7          	lui	t6,0xdeadc
 198:	ee6f8f93          	addi	t6,t6,-282 # deadbee6 <end_of_test+0xdeadbd46>
 19c:	0040006f          	j	1a0 <end_of_test>

000001a0 <end_of_test>:
 1a0:	00000013          	nop
