.globl main
.data
	newline: .string "\n"
	star: .string "*"
.text

main:
	addi t1, zero, 1
	addi t2, zero, 0
	
	addi s1, zero, 10
	addi s2, zero, 0
	
for_i:
	bgt t1, s1, exit
	
	addi t2, zero, 0
	
for_j:
	beq t2, t1, end_j
	
	la a0, star
	addi a7, zero, 4 # syscall 4 = print string
	ecall # printa o asterisco
	
	addi t2, t2, 1
	j for_j

end_j:
	la a0, newline
	addi a7, zero, 4 # syscall 4 = print string
	ecall # printa o newline
	
	addi t1, t1, 1
	j for_i
	
exit:
	addi a7, zero, 10
	ecall