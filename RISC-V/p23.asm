# Programa 23
# Escreva um programa que leia um valor A da memória, o valor lido deverá ser passado para uma função que identifique se o número é negativo ou não e encontre o seu módulo. O valor deverá ser reescrito sobre A.

.data
    A: .word -10       # Altere este valor para diferentes testes

.text
.globl _start

_start:
    la a0, A           # Carregar endereço de A
    lw a0, 0(a0)       # Carregar A
    jal ra, valor_absoluto  # Chamar valor_absoluto
    la a1, A           # Carregar endereço de A
    sw a0, 0(a1)       # Armazenar o valor absoluto de volta em A
    li a7, 10          # Chamada de sistema para sair
    ecall

valor_absoluto:
    bltz a0, fazer_positivo # Se a0 < 0, fazer positivo
    jr ra                   # Retornar se a0 >= 0

fazer_positivo:
    neg a0, a0              # a0 = -a0
    jr ra                   # Retornar