.data
	quebra: .string "\n"
.text
main: 
	addi x9, zero, 24
	addi x10, zero, 42
for:
	bge x9, x10, exit
	li a7, 1
	add a0, zero, x9
	ecall
	la a0, quebra
	li a7, 4
	ecall
	addi x9, x9, 3
	jal for
exit:
	nop 
	