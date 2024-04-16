# Programa 1
# a = 2;
# b = 3;
# c = 4;
# d = 5;
# x = (a+b)-(c+d);
# y = a-b+x;
# b = x-y;

# .text
# .globl _start

# _start:
#     addi s0, x0, 2
#     addi s1, x0, 3
#     addi s2, x0, 4
#     addi s3, x0, 5
#     add t0, s0, s1
#     add t1, s2, s3
#     sub s4, t0, t1
#     nop

# Programa 2
# x=1;
# y=5-x+15;

# .text
# .globl _start

# _start:
#     addi s0, x0, 1   # x = 1
#     addi s1, x0, 5   # y = 5
#     sub s1, s1, s0   # y = 5 - x
#     addi s1, s1, 15  # y = 5 - x + 15
#     nop


# Programa 3
# x=3;
# y=4;
# z=(15-x)+(67-y)+4;

# .text
# .globl _start

# _start:
#     addi s0, x0, 3   # x = 3
#     addi s1, x0, 4   # y = 4
#     addi t0, x0, 15    # temp = 15
#     sub t0, t0, s0     # temp = 15 - x
#     addi t1, x0, 67    # temp2 = 67
#     sub t1, t1, s1     # temp2 = 67 - y
#     add t2, t0, t1     # temp = (15-x)+(67-y)
#     addi s2, t2, 4     # z = (15-x)+(67-y)+4
#     nop

# Programa 4
# x=1;
# y=5*x+15;

# .text
# .globl _start

# _start:
#     addi s0, x0, 1   # x = 1
#     addi s1, x0, 5   # y = 5
#     mul s1, s1, s0   # y = 5 * x
#     addi s1, s1, 15  # y = 5 * x + 15
#     nop

# Programa 5
# x=3;
# y=4;
# z=((15*x)+(67*y))*4;

# .text
# .globl _start

# _start:
#     addi s0, x0, 3   # x = 3
#     addi s1, x0, 4   # y = 4
#     addi t0, x0, 15    # temp = 15
#     mul t0, t0, s0     # temp = 15 * x
#     addi t1, x0, 67    # temp2 = 67
#     mul t1, t1, s1     # temp2 = 67 * y
#     add t2, t0, t1     # temp = (15*x)+(67*y)
#     slli t2, t2, 2     # temp = ((15*x)+(67*y))*4
#     add s2, x0, t2     # z = temp
#     nop

# Programa 6
# ATENÇÃO: Use os shifts para gerar os valores muito grandes
# x = 1048576; // 2 a 20
# y = 4096; // 2 a 12
# z = x + y;

# .text
# .globl _start

# _start:
#     li s0, 1
#     slli s0, s0, 20     # 10000000000000000000
#     li s1, 1
#     slli s1, s1, 12     # 100000000000
#     add s2, s0, s1      # x + y
#     nop

# Programa 7
# x = o maior inteiro possível; // Ou seja, uma palavra de 32 bits com todos os bits igual a 1
# y = 8192;
# z = x - 4y;

# .text
# .globl _start

# _start:
#     li s0, -1        # x = 11111111111111111111111111111111 c2
#     li s1, 8192      # y = 8192
#     slli t1, s1, 2   # temp = 4 * y (shift 2)
#     li t0, 4         # temp2 = 4
#     sub s2, s0, t1   # z = x - (4 * y)
#     nop

# Programa 8
# Considere a seguinte instrução iniciando um programa:
# Usando apenas instruções lógicas e instruções de deslocamento, continue o programa de forma que ao final, tenhamos o seguinte conteúdo no registrador $8:
# x8 = 0xFFFFFFFF

# xori x8, x8, 0x01   # Altera o bit 1 de x8 para 0
# not x8, x8      # Inverte todos os bits de x8 para definir todos os bits como 1
# nop

# Programa 9
# Inicialmente escreva um programa que faça:
# x8 = 0x12345678.
# A partir do registrador $8 acima, usando apenas instruções lógicas (or, ori, and, andi, xor, xori) e instruções de deslocamento (sll, srl e sra),
# você deverá obter os seguintes valores nos respectivos registradores:
# x9 = 0x12
# x10 = 0x34
# x11 = 0x56
# x12 = 0x78

# .text
# .globl _start

# _start:
#     # Inicialização
#     li x8, 0x12345678  # Load immediate value into x8

#     # Get the values for x9, x10, x11, and x12 using shifts and logical operations
#     slli x9, x8, 28    # Shift left by 28 bits to get the value of x9 (0x12)
#     srli x10, x8, 24   # Shift right by 24 bits to get the value of x10 (0x34)
#     srli x11, x8, 16   # Shift right by 16 bits to get the value of x11 (0x56)
#     srli x12, x8, 8    # Shift right by 8 bits to get the value of x12 (0x78)

# Programa 10
# # considere x mapeado em s1
# .text
# .globl _start
# _start:
# addi s1, zero, 1  # x = 1
# .data
# x1: .word 15
# x2: .word 25
# x3: .word 13
# x4: .word 17
# Observe o que acontece no MARS (ou outro simulador) na memória. Verifique por exemplo, em quais endereços o valor será armazenado. Coloque um print da tela que apresenta os dados no simulador.



# Programa 11
# Complete o programa anterior de maneira a ler os valores armazenados em x1, x2, x3 e x4 em registradores. Utilize as instruções de LOAD aprendidas em sala. Utilize também registradores para armazenar os endereços identificados no exercício anterior (caso o valor seja muito grande, utilize shifts para lhe auxiliar).



# Programa 12
# Considere os dados a seguir:

# .data
# x1: .word 15
# x2: .word 25
# x3: .word 13
# x4: .word 17
# soma: .word -1
# Escreva um programa que leia todos os números acima, e em seguida, calcule e armazene a soma desses números em um registrador. Ao final, o valor desse registrador deverá ser gravado na posição de memória representado por "soma" nos dados acima.



# Programa 13
# Considere a seguinte expressão: y = 127x - 65z + 1
# Faça um programa que calcule o valor de y, conhecendo os valores de x e z. Os valores de x e z estão armazenados na memória e na posição imediatamente posterior desses valores, deverá ser escrito o valor de y.
# Ou seja:
# .data
# x: .word 5
# z: .word 7
# y: .word 0  # esse valor deverá ser sobrescrito após a execução do programa



# Programa 14
# Considere o trecho de código a seguir, e compile esse código em assembly:
# int A[] = {1,3,5,7,9};
# int B[] = {2,4,6,8,10};
# A[0] = B[0] * 1 + A[0];
# A[1] = B[1] * 2 + A[1];
# A[2] = B[2] * 3 + A[2];
# A[3] = B[3] * 4 + A[3];
# A[4] = B[4] * 5 + A[4];
# Regra: Usar apenas um registrador para o endereço de A e outro para o endereço de B.



# Programa 15
# Substitua o código abaixo em assembly. As variáveis x, y e m devem ser armazenadas nos registradores s0, s1 e s2 respectivamente.
# int x = um_valor_inteiro_qualquer;
# int y = um_valor_inteiro_qualquer;
# int m = 0;
# if (x > y)
#     m = x;
# else
#     m = y;



# Programa 16
# Compile o código abaixo em assembly. Use qualquer mapeamento de variáveis em registradores, seguindo a convenção.
# int a = um_valor_inteiro_qualquer;
# int b = um_valor_inteiro_qualquer;
# int x = 0;
# if ( a >= 0 && b <= 50 ) 
#     x = 1;



# Programa 17
# Estude, com auxílio da internet e livros, como funciona um trecho de código do tipo switch/case. Verifique também como pode ser feito para este trecho de código ser compilado em assembly. Após os estudos, apresente um trecho de código usando switch/case em C, e seu correspondente em assembly.



# Programa 18
# Substitua o código abaixo em assembly. As variáveis temp e x devem ser armazenadas nos registradores s0 e s1 respectivamente.
# switch(temp){
#     case 10:
#         x = 10;
#         break;
#     case 25:
#         x = 25;
#         break;
#     default:
#         x = 0;
# }



# Programa 19
# Substitua o código abaixo em assembly. As variáveis i e x devem ser armazenadas nos registradores s0 e s1 respectivamente.
# while(i == 8){
#     x = i++;
# }



# Programa 20
# Compile para o assembly do RISC-V o código a seguir:
# int i;
# int A[10];
# for (i=0; i<10; i++) {
#    A[i]=A[i]+1;
# }



# Programa 21
# Compile para o assembly do RISC-V o código a seguir:
# int i;
# int A[10];
# for (i=0; i<10; i++) {
#    if (i%2==0)
#      A[i]=A[i]+A[i+1];
#    else 
#      A[i]=A[i]*2;
# }