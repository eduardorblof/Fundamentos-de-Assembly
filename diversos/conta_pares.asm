.data
	array: .word 1, 2, 3, 4, 5
.text
main:
	la a0, array
	addi a1, zero, 5
	jal ra, conta_pares
	
	addi a7, zero, 1
	ecall
exit:
	addi a7, zero, 10
	ecall
conta_pares:
	addi sp, sp, -16
	sw a0, 8(sp)
	sw a1, 4(sp)
	sw ra, 0(sp)
	
	addi t0, zero, 1
	bne a1, t0, caso_recursivo
base:
	lw t1, 0(a0)
	addi t0, zero, 2
	rem t2, t1, t0
	bne t2, zero, else
	addi a0, zero, 1
	j fim_base
else:
	addi a0, zero, 0
fim_base:
	lw ra, 0(sp)
	addi sp, sp, 16
	jalr zero, ra, 0
caso_recursivo:
	lw a0, 8(sp)
	lw a1, 4(sp)
	
	addi t3, a1, -1
	slli t3, t3, 2
	add t3, t3, a0
	lw t3, 0(t3)
	sw t3, 12(sp)
	
	addi a1, a1, -1
	jal ra, conta_pares
	
	lw t3, 12(sp)
	addi t0, zero, 2
	rem t1, t3, t0
	bne t1, zero, fim
	addi a0, a0, 1
fim:
	lw ra, 0(sp)
	addi sp, sp, 16
	jalr zero, ra, 0