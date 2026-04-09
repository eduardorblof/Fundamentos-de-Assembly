.data
prompt: .string "\n Digite uma string: "
buffer: .string
.text
main:
	la a0, prompt
	li a7, 4
	ecall
	la a0, buffer
	li a1, 32
	li a7, 8
	ecall
	la a0, buffer
	li a7, 4
	ecall
exit:
	nop