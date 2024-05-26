# Programa 25
# y = x**4 + x**3 - 2x**2, se x for par
# y = x**5 - x**3 + 1, se x for impar
# Os valores de x devem ser lidos da primeira posição livre da memória e o valor de y deverá ser escrito na segunda posição livre.

.data
    x: .word 2                     # Altere este valor para diferentes testes
    y: .word 0

.text
.globl _start

_start:
    la t0, x                       # Carregar endereço de x
    lw t1, 0(t0)                   # Carregar x
    andi t2, t1, 1                 # Verificar se x é ímpar
    beqz t2, caso_par              # Se x for par, ir para caso_par
    j caso_impar                   # Caso contrário, ir para caso_impar

caso_par:
    mul t3, t1, t1                 # t3 = x^2
    mul t4, t3, t1                 # t4 = x^3
    mul t5, t4, t1                 # t5 = x^4
    li t6, 2
    mul t6, t6, t3                 # t6 = 2 * x^2
    sub t5, t5, t6                 # t5 = x^4 - 2 * x^2
    add t5, t5, t4                 # t5 = x^4 + x^3 - 2 * x^2
    la t0, y                       # Carregar endereço de y
    sw t5, 0(t0)                   # Armazenar y
    j end                          # Sair do programa

caso_impar:
    mul t3, t1, t1                 # t3 = x^2
    mul t4, t3, t1                 # t4 = x^3
    mul t5, t4, t1                 # t5 = x^4
    mul t6, t5, t1                 # t6 = x^5
    sub t6, t6, t4                 # t6 = x^5 - x^3
    addi t6, t6, 1                 # t6 = x^5 - x^3 + 1
    la t0, y                       # Carregar endereço de y
    sw t6, 0(t0)                   # Armazenar y

end:
    nop