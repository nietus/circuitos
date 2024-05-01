# Programa 7
# x = o maior inteiro possível; // Ou seja, uma palavra de 32 bits com todos os bits igual a 1
# y = 8192;
# z = x - 4y;

.text
.globl _start

_start:
    li s0, -1        # x = 11111111111111111111111111111111 c2
    li s1, 8192      # y = 8192
    slli t1, s1, 2   # temp = 4 * y (shift 2)
    li t0, 4         # temp2 = 4
    sub s2, s0, t1   # z = x - (4 * y)
    nop