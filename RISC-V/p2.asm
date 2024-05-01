# Programa 2
# x=1;
# y=5-x+15;

.text
.globl _start

_start:
    addi s0, x0, 1   # x = 1
    addi s1, x0, 5   # y = 5
    sub s1, s1, s0   # y = 5 - x
    addi s1, s1, 15  # y = 5 - x + 15
    nop