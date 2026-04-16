main: 
	# s0 = temp; s1 = x
	addi s0, zero, 5
	addi t0, zero, 10
	addi t1, zero, 25
	addi t2, zero, 0
switch:
	beq  s0, t0, case_1
	beq s0, t1, case_2
	j default
case_1:
	add s1, zero, t0
	j exit
case_2:
	
	add s1, zero, t1
	j exit
default:
	add s1, zero, t2
	j exit
exit:
	nop