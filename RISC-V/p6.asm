# Programa 6
# ATENÇÃO: Use os shifts para gerar os valores muito grandes
# x = 1048576; // 2 a 20
# y = 4096; // 2 a 12
# z = x + y;

.text
.globl _start

_start:
    li s0, 1
    slli s0, s0, 20     # 10000000000000000000
    li s1, 1
    slli s1, s1, 12     # 100000000000
    add s2, s0, s1      # x + y
    nop