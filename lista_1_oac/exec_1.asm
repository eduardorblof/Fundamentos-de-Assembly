
main: 
	# t0 = A; t2 = B
	xor t0, t0, t2
	xor t2, t0, t2 # t2 = (A XOR B) XOR B = A XOR (B XOR B) = A XOR 0 = A
	xor t0, t2, t0 # t0 = A XOR (A XOR B) = (A XOR A) XOR B = 0 XOR B = B
	
end:
	nop
	
	
	