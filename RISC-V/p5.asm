# Programa 5
# x=3;
# y=4;
# z=((15*x)+(67*y))*4;

.text
.globl _start

_start:
    addi s0, x0, 3   # x = 3
    addi s1, x0, 4   # y = 4
    addi t0, x0, 15    # temp = 15
    mul t0, t0, s0     # temp = 15 * x
    addi t1, x0, 67    # temp2 = 67
    mul t1, t1, s1     # temp2 = 67 * y
    add t2, t0, t1     # temp = (15*x)+(67*y)
    slli t2, t2, 2     # temp = ((15*x)+(67*y))*4
    add s2, x0, t2     # z = temp
    nop