.data
newline: .ascii "\n"
.text
main:
	add t1, zero, zero # t1 = 0
	addi s1, zero, 4   # s1 = 4
loop:
	slti t0, t1, 5     # t1 < 5 ? 1 : 0
	addi s3, zero, 2   # s3 = 2
	mul s2, s1, s3     # s2 = s1 * s3
	beq t0, zero, exit # t0 = 0 ? exit : continue
	addi s1, s1, 2     # s1 = s1 + 2 
	addi t1, t1, 1     # t1 = t1 + 1
	j loop
exit:
	addi a0, t1, 0
	addi a7, zero, 1
	ecall
	
	la a0, newline
	addi a7, zero, 4
	ecall
	
	addi a0, s1, 0
	addi a7, zero, 1
	ecall
	
	la a0, newline
	addi a7, zero, 4
	ecall
	
	addi a0, s2, 0
	addi a7, zero, 1
	ecall
	
	addi a7, zero, 10
	ecall
# t1 = 5
# s2 = 14
# s1 = 28