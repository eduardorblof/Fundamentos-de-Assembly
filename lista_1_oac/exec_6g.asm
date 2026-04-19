.globl main
.data
	newline: .string "\n"
	
.text

main:
	addi s0, zero, 0 # i
	addi s1, zero, 0 # j
	addi t0, zero, 0 # n
	addi t1, zero, 0 # total
	addi t2, zero, 0 # how_many

   	# escaneia a entrada
	addi a7, zero, 5
	ecall
    
	# atribui a entrada a how_many
	addi t2, a0, 0
    
    	# atribui 1 a n
	addi t0, zero, 1 # n = 1
	
while:
	bgt t0, t2, exit
	addi t1, zero, 0 # total = 0
	addi s1, zero, 1 # j = 1
	
while_j:
	bgt s1, t0, end_while
	addi s0, zero, 1 # i = 1
while_i:
	bgt s0, s1, end_j
	add t1, t1, s0  # total = total + i
	addi s0, s0, 1 # i = i + 1
	j while_i
end_j:
	addi s1, s1, 1 # j = j + 1
	j while_j
	
end_while:

	# printa o total
	addi a0, t1, 0
	addi a7, zero, 1
	ecall
	
	# printa "\n"
	la a0, newline
	addi a7, zero, 4
	ecall
	
	# n = n + 1
	addi t0, t0, 1
	j while

exit:
	# finaliza o programa
	addi a7, zero, 10
	ecall
