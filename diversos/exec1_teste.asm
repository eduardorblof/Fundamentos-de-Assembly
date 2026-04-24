.data
	prompt   : .string "Valor de n: "
	func_head: .string "f("
	func_tail: .string ") = "
	newline  : .string "\n"
.text
	
	la a0, prompt
	addi a7, zero, 4
	ecall
	
	addi a7, zero, 5
	ecall
	add s1, zero, a0
	
	addi s0, zero, 1
	
loop:
	bgt s0, s1, exit
	
	la a0, func_head
	addi a7, zero, 4
	ecall
	
	addi a0, s0, 0
	addi a7, zero, 1
	ecall
	
	la a0, func_tail
	addi a7, zero, 4
	ecall	
	
	addi a0, s0, 0
	jal ra, f
	
	addi a7, zero, 1
	ecall
	
	la a0, newline
	addi a7, zero, 4
	ecall
	
	addi s0, s0, 1
	j loop

exit:
	addi a7, zero, 10
	ecall
	
f:
	addi sp, sp , -12
	sw   a0, 8(sp)
	sw   ra, 4(sp)
	
base1:
	addi t1, zero, 1
	# checa o caso base 1
	bne  a0, t1, base2
	
	addi a0, zero, 1
	
	lw ra, 4(sp)
	addi sp, sp, 12
	jalr zero, ra, 0

base2:
	addi t2, zero, 2
	#checa o caso base 2
	bne  a0, t2, rec_case
	
	addi a0, zero, 2
	
	lw ra, 4(sp)
	addi sp, sp, 12
	jalr zero, ra, 0
	
rec_case:
	addi a0, a0, -1
	jal ra, f # calcula f(n-1)
	sw a0, 0(sp) #guarda o valor 
	
	lw a0, 8(sp)
	addi a0, a0, -2
	jal ra, f # calcula f(n-2)
	
	lw t0, 0(sp)
	slli t0, t0, 1 # t0 = 2 * f(n-1)
	addi t1, a0, 0 # t1 = f(n-2)
	slli t1, t1, 1 # t1 = 2* f(n-2)
	add  t1, t1, a0 # t1 = 2*f(n-2) + f(n-2)
	add a0, t1, t0 
	
	lw ra, 4(sp)
	addi sp, sp, 12
	jalr zero, ra, 0
	
	
	
	
	
	
	









	
