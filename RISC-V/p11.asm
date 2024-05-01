#Programa 11
# Considere a seguinte expressão: y = 127x - 65z + 1
# Faça um programa que calcule o valor de y, conhecendo os valores de x e z. Os valores de x e z estão armazenados na memória e na posição imediatamente posterior desses valores, deverá ser escrito o valor de y.
# Ou seja:
# .data
# x: .word 5
# z: .word 7
# y: .word 0  # esse valor deverá ser sobrescrito após a execução do programa

.data
x: .word 5
z: .word 7
y: .word 0  # esse valor deverá ser sobrescrito após a execução do programa

.text
.globl _start
_start:
la t0, x
la t1, z
la t2, y
lw s0, 0(t0)
lw s1, 0(t1)
li t3, 127
li t4, 65
mul t3, t3, s0
mul t4, t4, s1
sub t3, t3, t4
addi t3, t3, 1
sw t3, 0(t2)
nop