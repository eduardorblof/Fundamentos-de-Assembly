.data
vetor: .word 1, 3, 5, 7, 9
.text
main:
	la a0, vetor
	addi a1, zero, 5
	
	jal ra, esta_ordenado
	addi a7, zero, 1
	ecall
exit:
	addi a7, zero, 10
	ecall
esta_ordenado:
	addi sp, sp, -16
	sw a0, 8(sp)
	sw a1, 4(sp)
	sw ra, 0(sp)
base:
	addi t1, zero, 1
	bne a1, t1, caso_recursivo
	addi a0, zero, 1
	
	lw ra, 0(sp)
	addi sp, sp, 16
	jalr zero, ra, 0
	
caso_recursivo:
	lw a0, 8(sp)
	lw a1, 4(sp)
	
	lw t0, 0(a0)
	lw t1, 4(a0)
	bgt t0, t1, nao_ordenado
	
	addi a0, a0, 4	
	addi a1, a1, -1
	jal ra, esta_ordenado
	jal zero, fim
	
nao_ordenado:
	addi a0, zero, 0
	lw ra, 0(sp)
	addi sp, sp, 16
	jalr zero, ra, 0	
fim:
	lw ra, 0(sp)
	addi sp, sp, 16
	jalr zero, ra, 0