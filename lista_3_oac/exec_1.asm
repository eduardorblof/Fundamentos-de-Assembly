.data
vetor: .word 11, 22, 33, 44, 55, 55, 66
.text

main:
	addi a7, zero, 5
	ecall
	
	la t0, vetor
	addi t1, zero, 0
	addi t2, zero, 6
	
busca:
	# inicio loop
	bgt t1, t2, not_found
	
	# calculo do indice do elemento do meio
	add t3, t1, t2
	srai t3, t3, 1
	
	# calculo do endereço do elemento do meio
	slli t4, t3, 2
	add  t4, t0, t4
	lw t5, 0(t4)
	
	# comparações
	beq t5, a0, found
	blt t5, a0, right
	
	addi t2, t3, -1
	
	j busca
	
found:
	addi s0, t4, 0
	j print
	
not_found:
	addi s0, zero, -1
	j print
	
right:
	addi t1, t1, 1
	j busca
print:
	addi a0, s0, 0 
	addi a7, zero, 1
	ecall
	
	j fim
fim:
	addi a7, zero, 10
	ecall
	
	
	