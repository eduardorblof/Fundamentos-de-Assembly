main: 
	li s0, 10
	li s1 5
if:
	blt s1, s0, else
	add s2, s0, zero
	jal exit
	
	#slt t0, s1, s0
	#beq t0, zero, else
	#add s2, s0, zero
	
else: 
	add s2, s1, zero
exit:
	nop