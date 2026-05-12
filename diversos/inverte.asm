.data
array         : .space  40
open_bracket  : .string "{"
comma         : .string ", "
close_bracket : .string "}"
.text

main:
la   s0, array
addi t0, zero, 0
addi a7, zero, 5
ecall
addi s1, a0, 0

leitura:
beq  t0, s1, fim_leitura
addi a7, zero, 5
ecall
slli t5, t0, 2
add  t5, t5, s0
sw   a0, 0(t5)
addi t0, t0, 1
jal  zero, leitura

fim_leitura:
addi a0, s0, 0
addi a1, zero, 0
addi a2, s1, -1
jal  ra, inverte
addi t0, zero, 0

print:
la   a0, open_bracket
addi a7, zero, 4
ecall

for:
slli t5, t0, 2
add  t5, t5, s0
lw   a0, 0(t5)
addi a7, zero, 1
ecall
addi t0, t0, 1
beq  t0, s1, fim_print
la   a0, comma
addi a7, zero, 4
ecall 
jal  zero, for

fim_print:
la   a0, close_bracket
addi a7, zero, 4
ecall
jal  zero, exit

exit:
addi a7, zero, 10
ecall

inverte:
addi sp, sp, -16
sw   a0, 12(sp) # base
sw   a1,  8(sp) #  esq
sw   a2,  4(sp) #  dir
sw   ra,  0(sp)

base:
blt  a1, a2, caso_recursivo
lw   ra, 0(sp)
addi sp, sp, 16
jalr zero, ra, 0

caso_recursivo:
slli t5, a1, 2
add  t5, t5, a0 # endereço do a1
lw   t0, 0(t5)  # valor do a1 (temp)

slli t6, a2, 2
add  t6, t6, a0 
lw   t1, 0(t6)
sw   t1, 0(t5)
sw   t0, 0(t6)
addi a1, a1, 1
addi a2, a2, -1
jal  ra, inverte
lw   ra, 0(sp)
addi sp, sp, 16
jalr zero, ra, 0