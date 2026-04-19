.globl main
.text

main:
    addi t0, zero, 1
    addi t1, zero, 1
    addi s1, zero, 0

    addi t2, zero, 0
    addi t3, zero, 7

for: 
    beq t2, t3, exit
    add s1, t0, t1
    add t0, zero, t1
    add t1, zero, s1

    addi t2, t2, 1
    j for

exit:
    addi a0, s1, 0
    addi a7, zero, 1
    ecall
    addi a7, zero, 10 
    ecall