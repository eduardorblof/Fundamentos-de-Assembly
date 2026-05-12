.data
array: .word 10, 20, 30, 40, 50

.text
main:
    la   t0, array
    addi t1, zero, 0      # limite inferior = 0
    addi t2, zero, 4      # limite superior = 4

    addi a7, zero, 5
    ecall                 # lê índice em a0

validacao:
    slt  t3, a0, t1       # t3 = (a0 < 0)
    slt  t4, t2, a0       # t4 = (a0 > 4)
    or   t3, t3, t4       # t3 = índice inválido?

    addi t4, zero, 1
    bne  t3, t4, search   # se válido, vai para search

    addi a0, zero, -1
    jal  zero, exit

search:
    slli t5, a0, 2        # t5 = índice * 4
    add  t5, t0, t5       # t5 = endereço do elemento
    lw   a0, 0(t5)        # a0 = array[índice]

exit:
    addi a7, zero, 1
    ecall

    addi a7, zero, 10
    ecall