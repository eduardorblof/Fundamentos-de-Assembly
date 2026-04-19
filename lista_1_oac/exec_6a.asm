.globl main
.text

main:
	addi t0, zero, 0  # declara x
	addi t1, zero, 0  # declara y
	
	addi a7, zero, 5  
	ecall # coleta o input do usuario pela entrada principal
	 
	addi t0, a0, 0 # armazena o valor de entrada em x
	
	add t1, t0, t0 # atribui a y o valor de x + x
	
	addi a0, t1, 0 # atribui o valor de y para print
	addi a7, zero, 1
	ecall 	# printa o valor de y
	
	addi a0, zero, 10 #ASCII de '\n'
	addi a7, zero, 11 # syscall 11 = print character
	ecall # printa o newline
	
exit:
	addi a7, zero, 10
	ecall