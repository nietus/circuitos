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
#     li   x8, 0x12345678   # Inicializa x8 com 0x12345678

#     # Obtenção do valor de x9
#     srli x9, x8, 24      # Desloca x8 para a direita por 24 bits para obter os próximos bits significativos
#     andi x9, x9, 0xFF   # Mantém apenas os 8 bits menos significativos de x9

#     # Obtenção do valor de x10
#     srli x10, x8, 16      # Desloca x8 para a direita por 16 bits para obter os próximos bits significativos
#     andi x10, x10, 0xFF   # Mantém apenas os 8 bits menos significativos de x10

#     # Obtenção do valor de x11
#     srli x11, x8, 8       # Desloca x8 para a direita por 8 bits para obter os próximos bits significativos
#     andi x11, x11, 0xFF   # Mantém apenas os 8 bits menos significativos de x11

#     # Obtenção do valor de x12
#     andi x12, x8, 0xFF   # Mantém apenas os 8 bits menos significativos de x8
#     nop

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

# Feito

# Programa 11
# Complete o programa anterior de maneira a ler os valores armazenados em x1, x2, x3 e x4 em registradores. Utilize as instruções de LOAD aprendidas em sala. Utilize também registradores para armazenar os endereços identificados no exercício anterior (caso o valor seja muito grande, utilize shifts para lhe auxiliar).

# .data
#     x1: .word 15
#     x2: .word 25
#     x3: .word 13
#     x4: .word 17
# .text
# .globl _start
# _start:
#     la t0, x1
#     la t1, x2
#     la t2, x3
#     la t3, x4
#     lw s0, 0(t0)
#     lw s1, 0(t1)
#     lw s2, 0(t2)
#     lw s3, 0(t3)
#     nop

# Programa 12
# Considere os dados a seguir:

# .data
# x1: .word 15
# x2: .word 25
# x3: .word 13
# x4: .word 17
# soma: .word -1
# Escreva um programa que leia todos os números acima, e em seguida, calcule e armazene a soma desses números em um registrador. Ao final, o valor desse registrador deverá ser gravado na posição de memória representado por "soma" nos dados acima.

# .data
# x1: .word 15
# x2: .word 25
# x3: .word 13
# x4: .word 17
# soma: .word -1

# .text
# .globl _start
# _start:
#     la t0, x1
#     la t1, x2
#     la t2, x3
#     la t3, x4
#     la t4, soma
    
#     lw s0, 0(t0)
#     lw s1, 0(t1)
#     lw s2, 0(t2)
#     lw s3, 0(t3)
    
#     add t0, s0, s1
#     add t1, s2, s3
#     add t2, t0, t1
    
#     sw t2, 0(t4)
#     nop


# Programa 13
# Considere a seguinte expressão: y = 127x - 65z + 1
# Faça um programa que calcule o valor de y, conhecendo os valores de x e z. Os valores de x e z estão armazenados na memória e na posição imediatamente posterior desses valores, deverá ser escrito o valor de y.
# Ou seja:
# .data
# x: .word 5
# z: .word 7
# y: .word 0  # esse valor deverá ser sobrescrito após a execução do programa

# .data
# x: .word 5
# z: .word 7
# y: .word 0  # esse valor deverá ser sobrescrito após a execução do programa

# .text
# .globl _start
# _start:
# la t0, x
# la t1, z
# la t2, y
# lw s0, 0(t0)
# lw s1, 0(t1)
# li t3, 127
# li t4, 65
# mul t3, t3, s0
# mul t4, t4, s1
# sub t3, t3, t4
# addi t3, t3, 1
# sw t3, 0(t2)
# nop

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

# .data
# A: .word 1, 3, 5, 7, 9
# B: .word 2, 4, 6, 8, 10

# .text
# .globl _start
# _start:
#     # Carregar endereço de A e B em registradores
#     la t0, A
#     la t1, B

#     # A[0] = B[0] * 1 + A[0]
#     lw t2, 0(t1)      # Carregar B[0] em t2
#     lw t3, 0(t0)      # Carregar A[0] em t3
#     add t3, t3, t2   # A[0] += B[0]
#     sw t3, 0(t0)      # Armazenar A[0] de volta em memória

#     # A[1] = B[1] * 2 + A[1]
#     lw t2, 4(t1)      # Carregar B[1] em t2
#     lw t3, 4(t0)      # Carregar A[1] em t3
#     slli t2, t2, 1    # B[1] *= 2
#     add t3, t3, t2   # A[1] += B[1]
#     sw t3, 4(t0)      # Armazenar A[1] de volta em memória

#     # A[2] = B[2] * 3 + A[2]
#     lw t2, 8(t1)      # Carregar B[2] em t2
#     lw t3, 8(t0)      # Carregar A[2] em t3
#     li t4, 3
#     mul t2, t2, t4     # B[2] *= 3
#     add t3, t3, t2   # A[2] += B[2]
#     sw t3, 8(t0)      # Armazenar A[2] de volta em memória

#     # A[3] = B[3] * 4 + A[3]
#     lw t2, 12(t1)     # Carregar B[3] em t2
#     lw t3, 12(t0)     # Carregar A[3] em t3
#     li t4, 4
#     mul t2, t2, t4     # B[3] *= 4
#     add t3, t3, t2   # A[3] += B[3]
#     sw t3, 12(t0)     # Armazenar A[3] de volta em memória

#     # A[4] = B[4] * 5 + A[4]
#     lw t2, 16(t1)     # Carregar B[4] em t2
#     lw t3, 16(t0)     # Carregar A[4] em t3
#     li t4, 5
#     mul t2, t2, t4     # B[4] *= 5
#     add t3, t3, t2   # A[4] += B[4]
#     sw t3, 16(t0)     # Armazenar A[4] de volta em memória
#     nop

# Programa 15
# Substitua o código abaixo em assembly. As variáveis x, y e m devem ser armazenadas nos registradores s0, s1 e s2 respectivamente.
# int x = um_valor_inteiro_qualquer;
# int y = um_valor_inteiro_qualquer;
# int m = 0;
# if (x > y)
#     m = x;
# else
#     m = y;

# .data
# x: .word 30
# y: .word 20
# m: .word 0
# .text
# .globl _start
# _start:
#     la t0, x
#     la t1, y
#     la t2, m
#     lw s0, 0(t0)
#     lw s1, 0(t1) 
#     lw s2, 0(t2)
#     bgt s0, s1, greater_than   # Se x > y, vá para greater_than
#     # Senão, vá para less_than
#     j less_than

# greater_than:
#     # Se x > y, definir m como x
#     mv s2, s0          # Mover o valor de x para m
#     j end

# less_than:
#     # Se x <= y, definir m como y
#     mv s2, s1          # Mover o valor de y para m
#     j end

# end:
#     nop


# Programa 16
# Compile o código abaixo em assembly. Use qualquer mapeamento de variáveis em registradores, seguindo a convenção.
# int a = um_valor_inteiro_qualquer;
# int b = um_valor_inteiro_qualquer;
# int x = 0;
# if ( a >= 0 && b <= 50 ) 
#     x = 1;

# .data
# a: .word 30
# b: .word 20
# x: .word 0
# .text
# .globl _start
# _start:
#     la t0, a
#     la t1, b
#     la t2, x
#     li t3, 50
#     lw s0, 0(t0)
#     lw s1, 0(t1) 
#     lw s2, 0(t2)
#     beq s0, x0, b_match # a == 0
#     bgt s0, x0, b_match # a > 0
#     j end

# b_match:
#     beq s2, t3, x_1
#     blt s2, t3, x_1
#     j end

# x_1:
#     li t3, 1
#     sw t3, 0(t2)

# end:
#     nop

# Programa 17
# Estude, com auxílio da internet e livros, como funciona um trecho de código do tipo switch/case. Verifique também como pode ser feito para este trecho de código ser compilado em assembly. Após os estudos, apresente um trecho de código usando switch/case em C, e seu correspondente em assembly.

# #include <stdio.h>

# int main() {
#     int opcao = 2;

#     switch (opcao) {
#         case 1:
#             printf("Opcao 1 selecionada.\n");
#             break;
#         case 2:
#             printf("Opcao 2 selecionada.\n");
#             break;
#         case 3:
#             printf("Opcao 3 selecionada.\n");
#             break;
#         default:
#             printf("Opcao invalida.\n");
#     }

#     return 0;
# }

# # No GNU assembler (gcc teste.c -S)

# 	.file	"teste.c"
# 	.def	___main;	.scl	2;	.type	32;	.endef
# 	.section .rdata,"dr"
# LC0:
# 	.ascii "Opcao 1 selecionada.\0"
# LC1:
# 	.ascii "Opcao 2 selecionada.\0"
# LC2:
# 	.ascii "Opcao 3 selecionada.\0"
# LC3:
# 	.ascii "Opcao invalida.\0"
# 	.text
# 	.globl	_main
# 	.def	_main;	.scl	2;	.type	32;	.endef
# _main:
# LFB10:
# 	.cfi_startproc
# 	pushl	%ebp
# 	.cfi_def_cfa_offset 8
# 	.cfi_offset 5, -8
# 	movl	%esp, %ebp
# 	.cfi_def_cfa_register 5
# 	andl	$-16, %esp
# 	subl	$32, %esp
# 	call	___main
# 	movl	$2, 28(%esp)
# 	movl	28(%esp), %eax
# 	cmpl	$2, %eax
# 	je	L3
# 	cmpl	$3, %eax
# 	je	L4
# 	cmpl	$1, %eax
# 	jne	L8
# 	movl	$LC0, (%esp)
# 	call	_puts
# 	jmp	L6
# L3:
# 	movl	$LC1, (%esp)
# 	call	_puts
# 	jmp	L6
# L4:
# 	movl	$LC2, (%esp)
# 	call	_puts
# 	jmp	L6
# L8:
# 	movl	$LC3, (%esp)
# 	call	_puts
# L6:
# 	movl	$0, %eax
# 	leave
# 	.cfi_restore 5
# 	.cfi_def_cfa 4, 4
# 	ret
# 	.cfi_endproc
# LFE10:
# 	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
# 	.def	_puts;	.scl	2;	.type	32;	.endef

# # Em assembly do RISC-V

# .section .text
# .globl main

# main:
#     # Preparar a variável opcao
#     li t0, 2   # Valor da variável opcao (por exemplo, 2)

#     # Comparar o valor da variável opcao com cada caso
#     li t1, 1
#     beq t0, t1, case_1   # Se opcao == 1, vá para case_1
#     li t1, 2
#     beq t0, t1, case_2   # Se opcao == 2, vá para case_2
#     li t1, 3
#     beq t0, t1, case_3   # Se opcao == 3, vá para case_3

#     # Se opcao não corresponder a nenhum caso, vá para o padrão (default)
#     j default_case

# case_1:
#     # Caso 1: Opcao 1 selecionada
#     # Aqui você coloca o código correspondente ao caso 1
#     # Por exemplo, imprimir uma mensagem
#     .ascii "Opcao 1 selecionada.\n"
#     j end_switch

# case_2:
#     # Caso 2: Opcao 2 selecionada
#     # Aqui você coloca o código correspondente ao caso 2
#     # Por exemplo, imprimir uma mensagem
#     .ascii "Opcao 2 selecionada.\n"
#     j end_switch

# case_3:
#     # Caso 3: Opcao 3 selecionada
#     # Aqui você coloca o código correspondente ao caso 3
#     # Por exemplo, imprimir uma mensagem
#     .ascii "Opcao 3 selecionada.\n"
#     j end_switch

# default_case:
#     # Caso padrão: Opcao inválida
#     # Aqui você coloca o código correspondente ao caso padrão
#     # Por exemplo, imprimir uma mensagem
#     .ascii "Opcao invalida.\n"

# end_switch:
#     nop

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