.data
    x: .word -3                    # Altere este valor para diferentes testes
    y: .word 0

.text
.globl _start

_start:
    la t0, x                       # Carregar endereço de x
    lw t1, 0(t0)                   # Carregar x
    blez t1, caso_nao_positivo     # Se x <= 0, ir para caso_nao_positivo
    j caso_positivo                # Caso contrário, ir para caso_positivo

caso_positivo:
    mul t3, t1, t1                 # t3 = x^2
    mul t4, t3, t1                 # t4 = x^3
    addi t4, t4, 1                 # t4 = x^3 + 1
    la t0, y                       # Carregar endereço de y
    sw t4, 0(t0)                   # Armazenar y
    j end                          # Sair do programa

caso_nao_positivo:
    mul t3, t1, t1                 # t3 = x^2
    mul t4, t3, t1                 # t4 = x^3
    mul t5, t4, t1                 # t5 = x^4
    addi t5, t5, -1                # t5 = x^4 - 1
    la t0, y                       # Carregar endereço de y
    sw t5, 0(t0)                   # Armazenar y

end:
    nop
