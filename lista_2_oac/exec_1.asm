.data
	func_head: .string "f("
	func_tail: .string ") = "
	newline:   .string "\n"
.text
main:
	addi a7, zero, 5
	ecall
	
	add s0, zero, a0
	addi s1, zero, 1
	
loop:
    	bgt s1, s0, exit
    	
    	addi a0, s1, 0
    	jal f                    # a0 = f(i)
    	add  s2, zero, a0        # salva f(i) em s2

    	# printa "f("
    	la   a0, func_head
    	addi a7, zero, 4
    	ecall

    	# printa i
    	addi a0, s1, 0
    	addi a7, zero, 1
    	ecall

    	# printa ") = "
    	la   a0, func_tail
    	addi a7, zero, 4
    	ecall

    	# printa f(i)
    	addi a0, s2, 0
    	addi a7, zero, 1
    	ecall

    	# printa newline
    	la   a0, newline
    	addi a7, zero, 4
    	ecall

    	addi s1, s1, 1
    	jal  zero, loop        
	addi a7, zero, 10
	ecall
	
exit:
    	addi a7, zero, 10
    	ecall
	
f:
	addi sp, sp, -12
	sw a0, 8(sp)
	sw ra, 4(sp)
	
	addi t0, zero, 1
	beq a0, t0, base1
	
	addi t1, zero, 2
	beq a0, t1, base2
	
	#calcula f(n-1)
	addi a0, a0, -1
	jal f
	sw a0, 0(sp) # salva o resultado de f(n-1)
	
	#calcula f(n-2)
	lw a0, 8(sp) # recupera o valor anterior de n
	addi a0, a0, -2
	jal f
	
	lw   t0, 0(sp)  # t0 = f(n-1)
	slli t0, t0, 1  #t0 = 2 * t1
	addi t1, a0, 0  #t1 = f(n-2)
	slli t1, t1, 1  #t1 = 2 * t1
	add  t1, t1, a0 #t1= 2* t1 + t1
	add  a0, t0, t1 #a0 = resultado
	
	#restaura e retorna
	lw   ra, 4(sp) # recupera o endereço de retorno
	addi sp, sp, 12
	jalr zero, ra, 0
	
base1:
	addi   a0, zero, 1
	lw   ra, 4(sp)
	addi sp, sp, 12
	jalr zero, ra, 0
	
base2:
	addi   a0, zero, 2
	lw   ra, 4(sp)
	addi sp, sp, 12
	jalr zero, ra, 0