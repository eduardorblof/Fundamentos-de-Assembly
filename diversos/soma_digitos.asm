.text
main:
    addi a7, zero, 5
    ecall
    jal  ra, soma_digitos
    addi a7, zero, 1
    ecall

exit:
    addi a7, zero, 10
    ecall

soma_digitos:
    addi sp, sp, -12
    sw   a0, 8(sp)      # salva n
    sw   ra, 0(sp)

    addi t0, zero, 10	
    rem  t1, a0, t0     # t1 = n % 10

    bne  a0, t1, caso_recursivo   # se n != n%10, n >= 10

    # caso base: n < 10, retorna n
    lw   ra, 0(sp)
    addi sp, sp, 12
    jalr zero, ra, 0

caso_recursivo:
    sw   t1, 4(sp)      # salva dígito atual
    div  a0, a0, t0     # a0 = n / 10
    jal  ra, soma_digitos

    lw   t0, 4(sp)      # recupera dígito
    add  a0, a0, t0     # soma com resultado recursivo

    lw   ra, 0(sp)
    addi sp, sp, 12
    jalr zero, ra, 0