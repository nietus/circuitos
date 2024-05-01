# Programa 10
# Considere os dados a seguir:

# .data
# x1: .word 15
# x2: .word 25
# x3: .word 13
# x4: .word 17
# soma: .word -1
# Escreva um programa que leia todos os números acima, e em seguida, calcule e armazene a soma desses números em um registrador. Ao final, o valor desse registrador deverá ser gravado na posição de memória representado por "soma" nos dados acima.

.data
x1: .word 15
x2: .word 25
x3: .word 13
x4: .word 17
soma: .word -1

.text
.globl _start
_start:
    la t0, x1
    la t1, x2
    la t2, x3
    la t3, x4
    la t4, soma
    
    lw s0, 0(t0)
    lw s1, 0(t1)
    lw s2, 0(t2)
    lw s3, 0(t3)
    
    add t0, s0, s1
    add t1, s2, s3
    add t2, t0, t1
    
    sw t2, 0(t4)
    nop