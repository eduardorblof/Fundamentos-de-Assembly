.data
	vetor: .word 3, 7, 2, 9, 5
.text
main:
	la a0, vetor
	addi a1, zero, 5
	
	jal ra, max_array
	addi a7, zero, 1
	ecall
exit:
	addi a7, zero, 10
	ecall
max_array:
	addi sp, sp, -16
	sw   a0, 8(sp)
	sw   a1, 4(sp)
	sw   ra, 0(sp)
	
base:
	addi t1, zero, 1
	bne a1, t1, caso_recursivo
	lw a0, 0(a0)
	
	lw ra, 0(sp)
	addi sp, sp, 16
	jalr zero, ra, 0
	
caso_recursivo:
	lw a0, 8(sp)
	lw a1, 4(sp)
	addi a1, a1, -1 # n-1
	
	slli t5, a1,  2
	add  t5, t5, a0
	lw   t1, 0(t5)
	sw   t1, 12(sp)
	
	jal ra, max_array
	
	lw t0, 12(sp)
	bge a0, t0, fim
	addi a0, t0, 0
fim:
	lw ra, 0(sp)
	addi sp, sp, 16
	jalr zero, ra, 0