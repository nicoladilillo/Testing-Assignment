	.section .text
	.global _sbst_boot
	.type _sbst_boot, @function

_sbst_boot:
	// add sp, sp, 16		// this creates space in the stack

	lui		a0, %hi(__TEST_DATA_START)
	addi	a0, a0, %lo(__TEST_DATA_START)

	// TODO: preserve all non-volatile registers (use section .TEST_DATA)
	sw		x1, 16(a0)
	sw		x2, 4(a0)
	sw		x3, 8(a0)
	sw		x4, 12(a0)

	// TODO: disable interrupts (if they were enabled)
	csrrc 	x18, mstatus, x0	// store interrupts value
	addi	x1, x0, 8
	csrrc 	x2, mstatus, x1		// disable always

	// here are some random instructions...
	la		x19, RF_PATTERNS

	// here I used tX registers, you should do it for all x1-x31

	// FIRST PART OF REGISTERS
	lw      		x1, 0(x19)
	lw             	x2, 4(x19)
	lw             	x3, 8(x19)
	lw             	x4, 12(x19)
	lw             	x5, 16(x19)
	lw             	x6, 20(x19)
	lw				x7, 24(x19)
	lw             	x8, 28(x19)
	lw             	x9, 32(x19)
	lw             	x10, 36(x19)
	lw             	x11, 40(x19)
	lw             	x12, 44(x19)
	lw             	x13, 48(x19)
	lw             	x14, 52(x19)
	lw             	x15, 56(x19)
				
	add             x2 ,x2 ,x1
	add             x3 ,x3 ,x2
	add             x4 ,x4 ,x3
	add             x5 ,x5 ,x4
	add             x6 ,x6 ,x5
	add             x7 ,x7 ,x6
	add             x8 ,x8 ,x7
	add             x9 ,x9 ,x8
	add             x10 ,x10 ,x9
	add             x11 ,x11 ,x10
	add             x12 ,x12 ,x11
	add             x13 ,x13 ,x12
	add             x14 ,x14 ,x13
	add             x15 ,x15 ,x14

	// SECOND PART OF REGISTERS

	add 	x5, x18, x0 		// move mstatus register value
	la		x2, RF_PATTERNS

	lw      		x16, 60(x2)
	lw             	x17, 64(x2)
	lw             	x18, 68(x2)
	lw             	x19, 72(x2)
	lw             	x20, 76(x2)
	lw             	x21, 80(x2)
	lw				x22, 84(x2)
	lw             	x23, 88(x2)
	lw             	x24, 92(x2)
	lw             	x25, 96(x2)
	lw             	x26, 100(x2)
	lw             	x27, 104(x2)
	lw             	x28, 108(x2)
	lw             	x29, 112(x2)
	lw             	x30, 116(x2)
	lw             	x31, 120(x2)

	add             x16 ,x16 ,x15
	add             x17 ,x17 ,x16
	add             x18 ,x18 ,x17
	add             x19 ,x19 ,x18
	add             x20 ,x20 ,x19
	add             x21 ,x21 ,x20
	add             x22 ,x22 ,x21
	add             x23 ,x23 ,x22
	add             x24 ,x24 ,x23
	add             x25 ,x25 ,x24
	add             x26 ,x26 ,x25
	add             x27 ,x27 ,x26
	add             x28 ,x28 ,x27
	add             x29 ,x29 ,x28
	add             x30 ,x30 ,x29
	add             x31 ,x31 ,x30

	// write the result (check label 'test_result') 	
	la 	a0, test_result
	sw	x31, 0(a0)

	// TODO: restore non-volatile registers
	lui		a0, %hi(__TEST_DATA_START)
	addi	a0, a0, %lo(__TEST_DATA_START)

	// TODO: preserve all non-volatile registers (use section .TEST_DATA)
	lw		x1, 16(a0)
	lw		x2, 4(a0)
	lw		x3, 8(a0)
	lw		x4, 12(a0)

	// TODO: restore interrupts (if they were active before!)
	csrrs 	x6, mstatus, x5		// enable interrupts

	ret


// -------------------------------------
	.section ".TEST_DATA", "aw"
	.global test_result

test_result:
	.space 4
// Examples:
//variable1:	(4 * 4bytes)
//	.space 0x10
//variable2:
//	.space 4

// -------------------------------------
	.section ".TEST_RODATA", "a"

RF_PATTERNS:
	.long 0x12345678
	.long 0xcafecafe
	.long 0xdeadbeef
	.long 0x12345678
	.long 0xcafecafe
	.long 0xdeadbeef
	.long 0x12345678
	.long 0xcafecafe
	.long 0xdeadbeef
	.long 0x12345678
	.long 0xcafecafe
	.long 0xdeadbeef
	.long 0x12345678
	.long 0xcafecafe
	.long 0x12345678
	.long 0xcafecafe
	.long 0xdeadbeef
	.long 0x12345678
	.long 0xcafecafe
	.long 0xdeadbeef
	.long 0x12345678
	.long 0xcafecafe
	.long 0xdeadbeef
	.long 0x12345678
	.long 0xcafecafe
	.long 0xdeadbeef
	.long 0x12345678
	.long 0xcafecafe
	.long 0x12345678
	.long 0xcafecafe	
	.long 0xcafe1234	


OTHER_PATTERNS:
	.long 0x0
	.long 0x0
