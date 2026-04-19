.globl main
.data
	print_FL: .string "FL\n"
	print_PS: .string "PS\n"
	print_CR: .string "CR\n"
	print_DN: .string "DN\n"
	print_HD: .string "HD\n"
 
.text

main:
	addi t0, zero, 0 # mark

   	# escaneia a entrada
	addi a7, zero, 5
	ecall
    
	# atribui a entrada a mark
	addi t0, a0, 0  
    
	addi s0, zero, 50 
	addi s1, zero, 65 
	addi s2, zero, 75
	addi s3, zero, 85 

FL:
	bge t0, s0, PS
	# printa "FL\n"
	la a0, print_FL
	addi a7, zero, 4
	ecall
	j exit
PS:
	bge t0, s1, CR
	# printa "FL\n"
	la a0, print_PS
	addi a7, zero, 4
	ecall
	j exit	
CR:
	bge t0, s2, DN
	# printa "CR\n"
	la a0, print_CR
	addi a7, zero, 4
	ecall
	j exit
DN:
	bge t0, s3, else
	# printa "DN\n"
	la a0, print_DN
	addi a7, zero, 4
	ecall
	j exit
else:
	# printa "HD\n"
	la a0, print_HD
	addi a7, zero, 4
	ecall
	j exit
exit:
	# finaliza o programa
	addi a7, zero, 10
	ecall
