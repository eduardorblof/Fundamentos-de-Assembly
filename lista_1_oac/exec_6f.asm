.globl main
.data
	newline: .string "\n"
	
.text

main:
	addi t0, zero, 0 # number
	addi s0, zero, 0 # i

   	# escaneia a entrada
	addi a7, zero, 5
	ecall
    
	# atribui a entrada a number
	addi t0, a0, 0  
    
    	# atribui 1 a i
	addi s0, zero, 1
	
while:
	bgt s0, t0, exit
	
	# printa o número
	addi a0, s0, 0
	addi a7, zero, 1
	ecall
	
	la a0, newline
	addi a7, zero, 4
	ecall
	
	addi s0, s0, 1
	
	j while
	
exit:
	# finaliza o programa
	addi a7, zero, 10
	ecall
