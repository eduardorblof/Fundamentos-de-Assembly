.data
quebra: .string "\n"

.text
main:
	addi t0, zero, 24   
	addi t1, zero, 42   

for:
	bge t0, t1, exit

	addi a7, zero, 1
	add  a0, zero, t0
	ecall

	la a0, quebra
	addi a7, zero, 4
	ecall

	addi t0, t0, 3
	jal x0, for

exit:
	addi a7, zero, 10
	ecall