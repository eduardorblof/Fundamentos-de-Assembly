.data 
array: .space 40
.text
main:
la s0, array
addi t0, zero, 0
addi a7, zero, 5
ecall
addi t1, a0, 0
addi t1, t1, -1
leitura:
bgt t0, t1, fim_leitura
addi a7, zero, 5
ecall
slli t5, t0, 2
add t5, t5, s0
sw a0, 0(t5)
addi t0, t0, 1
jal zero, leitura
fim_leitura:
addi a0, s0, 0
addi t1, t1, 1
addi a1, t1, 0
jal ra, soma_array
addi a7, zero, 1
ecall
exit:
addi a7, zero, 10
ecall
soma_array:
addi sp, sp, -16
sw   a0, 8(sp)
sw   a1, 4(sp)
sw   ra, 0(sp)
base:
addi t0, zero, 0
bne a1, t0, caso_recursivo
addi a0, zero, 0
lw ra, 0(sp)
addi sp, sp, 16
jalr zero, ra, 0
caso_recursivo:
lw a0, 8(sp)
lw a1, 4(sp)
addi a1, a1, -1
slli t5, a1, 2
add  t5, t5, s0
lw   t1, 0(t5)
sw   t1, 12(sp)
jal ra, soma_array
lw t1, 12(sp)
add a0, a0, t1
lw ra, 0(sp)
addi sp, sp, 16
jalr zero, ra, 0