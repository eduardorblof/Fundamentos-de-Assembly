.data
	separador: .string "; "
	
.text
	#imprimir os números no intervalo [-10:10]
	li x5, -10
	li x6, 10
	
	imprimirIntervalo:
		add x10, x0, x5 # armazena o número do x5 em a0
		li x17, 1
		ecall
		
		beq x5, x6, exit
		#imprimir o separador
		li a7, 4
		la a0, separador
		ecall
		
		addi x5,x5, 1
		jal imprimirIntervalo
		
	exit:
		nop