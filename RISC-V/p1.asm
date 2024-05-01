# Programa 1
# a = 2;
# b = 3;
# c = 4;
# d = 5;
# x = (a+b)-(c+d);
# y = a-b+x;
# b = x-y;

.text
.globl _start

_start:
    addi s0, x0, 2
    addi s1, x0, 3
    addi s2, x0, 4
    addi s3, x0, 5
    add t0, s0, s1
    add t1, s2, s3
    sub s4, t0, t1
    nop