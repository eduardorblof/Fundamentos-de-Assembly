.globl main
.data
	n_equals: .string "n = "
	nfac_equals: .string "n! = "
    	newline: .string "\n"
.text

main:
	addi t0, zero, 0 # n

	# printa "n = "
	la a0, n_equals
	addi a7, zero, 4
	ecall
    
   	# escaneia a entrada
	addi a7, zero, 5
	ecall
    
	# atribui a entrada a n
	addi t0, a0, 0  
    
	addi s0, zero, 1 # fac
	addi s9, zero, 1 # i
	
for:
	bgt s9, t0, exit
	addi t1, s0, 0 # salva o valor de s0
	addi s0, zero, 0 # zero s0
	addi s10, zero, 0 # iterador da soma
for_mult:
	beq s10, s9, end_mul
	add s0, s0, t1 # s0 == t1 (soma s9 vezes)
	addi s10, s10, 1
	j for_mult
	
end_mul:
	addi s9, s9, 1
	j for

exit:
	# printa "n! = "
	la a0, nfac_equals
	addi a7, zero, 4
	ecall
	
	# printa s0
	addi a0, s0, 0
	addi a7, zero, 1
	ecall
	
	# printa "\n"
	la a0, newline
	addi a7, zero, 4
	ecall
	
	# finaliza o programa
	addi a7, zero, 10
	ecall
