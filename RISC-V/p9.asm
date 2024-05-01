# Programa 9
# Inicialmente escreva um programa que faça:
# x8 = 0x12345678.
# A partir do registrador $8 acima, usando apenas instruções lógicas (or, ori, and, andi, xor, xori) e instruções de deslocamento (sll, srl e sra),
# você deverá obter os seguintes valores nos respectivos registradores:
# x9 = 0x12
# x10 = 0x34
# x11 = 0x56
# x12 = 0x78

.text
.globl _start

_start:
    li   x8, 0x12345678   # Inicializa x8 com 0x12345678

    # Obtenção do valor de x9
    srli x9, x8, 24      # Desloca x8 para a direita por 24 bits para obter os próximos bits significativos
    andi x9, x9, 0xFF   # Mantém apenas os 8 bits menos significativos de x9

    # Obtenção do valor de x10
    srli x10, x8, 16      # Desloca x8 para a direita por 16 bits para obter os próximos bits significativos
    andi x10, x10, 0xFF   # Mantém apenas os 8 bits menos significativos de x10

    # Obtenção do valor de x11
    srli x11, x8, 8       # Desloca x8 para a direita por 8 bits para obter os próximos bits significativos
    andi x11, x11, 0xFF   # Mantém apenas os 8 bits menos significativos de x11

    # Obtenção do valor de x12
    andi x12, x8, 0xFF   # Mantém apenas os 8 bits menos significativos de x8
    nop