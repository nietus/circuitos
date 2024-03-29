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


# Programa 3
# x=3;
# y=4;
# z=(15-x)+(67-y)+4;

.text
.globl _start

_start:
    addi s0, x0, 3   # x = 3
    addi s1, x0, 4   # y = 4
    addi t0, x0, 15    # temp = 15
    sub t0, t0, s0     # temp = 15 - x
    addi t1, x0, 67    # temp2 = 67
    sub t1, t1, s1     # temp2 = 67 - y
    add t2, t0, t1     # temp = (15-x)+(67-y)
    addi s2, t2, 4     # z = (15-x)+(67-y)+4
    nop

# Programa 4
# x=1;
# y=5*x+15;

.text
.globl _start

_start:
    addi s0, x0, 1   # x = 1
    addi s1, x0, 5   # y = 5
    mul s1, s1, s0   # y = 5 * x
    addi s1, s1, 15  # y = 5 * x + 15
    nop

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

# Programa 8
# Considere a seguinte instrução iniciando um programa:
# ori x8, x0, 0x01
# Usando apenas instruções lógicas e instruções de deslocamento, continue o programa de forma que ao final, tenhamos o seguinte conteúdo no registrador $8:
# x8 = 0xFFFFFFFF

.text
.globl _start

_start:
    ori x8, x0, 0x01    # Inicializa x8 com 0x00000001
    xori x8, x8, 0x01   # Altera o bit 1 de x8 para 0
    not x8, x8          # Inverte todos os bits de x8 para definir todos os bits como 1
    nop

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