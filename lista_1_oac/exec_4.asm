main:
    addi t0, zero, 5382 # t0 = n 
    addi t1, zero, 0 # t1 = inv 

while:
    beq t0, zero, exit # se n == 0, termina

    addi t2, zero, 0 # t2 = q (quociente de n/10)
    add  t3, t0, zero # t3 = r (resto)

# DIVISÃO POR 10 

div_loop:
    addi t4, zero, 10 # constante 10
    slt  t5, t3, t4 # t5 = 1 se t3 < 10
    bne  t5, zero, div_end # se t3 < 10 termina a divisão

    addi t3, t3, -10 # t3 = t3 - 10 
    addi t2, t2, 1 # t2++ (conta quantas vezes subtraiu)
    j div_loop  # repete

div_end:
# t3 = resto (ultimo digito)
# t2 = quociente (n / 10)

# MULTIPLICAÇÃO POR 10 

    add  t6, t1, zero     
    slli t1, t1, 3        
    slli t6, t6, 1        
    add  t1, t1, t6       

# SOMA DO ÚLTIMO DÍGITO

    add  t1, t1, t3 # inv = inv*10 + resto

# ATUALIZA n

    add  t0, t2, zero # n = n / 10 (quociente)

    j while # volta pro loop

exit:
    nop