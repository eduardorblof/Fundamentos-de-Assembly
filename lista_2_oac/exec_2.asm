.data
    	func_head: .string "A("
    	comma:     .string ","
    	func_tail: .string ") = "
    	newline:   .string "\n"
    	promptn:   .string "Digite o valor de n: "
    	promptm:   .string "Digite o valor de m: "
   
.text

main:
    	#le m
    	la a0, promptm
    	addi a7, zero, 4
    	ecall

    	addi a7, zero, 5
    	ecall
    	addi s0, a0, 0

    	# le n
    	la a0, promptn
    	addi a7, zero, 4
    	ecall
    	
    	addi a7, zero, 5
    	ecall
	addi s1, a0, 0
	
    	# printa "A(m,n) = "
    	la   a0, func_head
    	addi a7, zero, 4
    	ecall

    	addi a0, s0, 0
    	addi a7, zero, 1
    	ecall

    	la   a0, comma
    	addi a7, zero, 4
    	ecall

   	addi a0, s1, 0
 	addi a7, zero, 1
    	ecall

	la   a0, func_tail
	addi a7, zero, 4
        ecall
        
        #chama ackermann
        addi a1, s0, 0
        addi a2, s1, 0
        jal ra, ackermann
        
        addi a7, zero, 1
        ecall
        
        la a0, newline
        addi a7, zero, 4
        ecall
        
exit:
	addi a7, zero, 10
	ecall
	
ackermann:
	addi sp, sp, -12
	sw   a1, 8(sp)
	sw   a2, 4(sp)
	sw   ra, 0(sp)
	
	# caso base m == 0 -> n+1
	bne a1, zero, case_m
	addi a0, a2, 1
	
	lw ra, 0(sp)
	addi sp, sp, 12
	jalr zero, ra, 0
	

case_m:
	#caso n == 0 -> A(m-1,1) 
	bne a2, zero, case_geral
	addi a1, a1, -1
	addi a2, zero, 1
	
	jal ra, ackermann
	
	lw ra, 0(sp)
	addi sp, sp, 12
	jalr zero, ra, 0
	
case_geral:
	# A(m-1, A(m, n-1))
	addi a2, a2, -1
	
	jal ra, ackermann
	
	lw   a1, 8(sp)
	addi a1, a1, -1
	addi a2, a0, 0
	
	jal ra, ackermann
	
	lw ra, 0(sp)
	addi sp, sp, 12
	jalr zero, ra, 0
