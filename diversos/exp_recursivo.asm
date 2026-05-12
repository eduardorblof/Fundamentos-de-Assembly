main:
# le expoente
addi a7, zero, 5
ecall
addi a1, a0, 0
#le base
addi a7, zero, 5
ecall
jal ra, potencia
addi a7, zero, 1
ecall
exit:
addi a7, zero, 10
ecall
potencia:
addi sp, sp, -12
sw a0, 8(sp)
sw a1, 4(sp)
sw ra, 0(sp)
base_0:
addi t0, zero, 0
bne a1, t0, base_1
addi a0, zero, 1
lw ra, 0(sp)
addi sp, sp, 12
jalr zero, ra, 0
base_1:
addi t0, zero, 1
bne a1, t0, caso_recursivo
lw a0, 8(sp)
lw ra, 0(sp)
addi sp, sp, 12
jalr zero, ra, 0
caso_recursivo:
addi a1, a1, -1
jal ra, potencia
lw t0, 8(sp)
mul a0, a0, t0
lw ra, 0(sp)
addi sp, sp, 12
jal zero, ra, 0