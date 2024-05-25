# Programa 24

# Considere os seguintes valores para a diretiva data:

# .data
# Vetor: .word 1, 3, 5, 7, 9, 11, 13, 0, 2, 4, 6, 8, 10, 12
# Soma: .word -1
# Maior: .word -1
# Escreva um programa que leia o vetor descrito no campo data, calcule a soma dos elementos do vetor, descubra o maior e armazene esses resultados na memória nos respectivos locais.

.data
    Vetor: .word 1, 3, 5, 7, 9, 11, 13, 0, 2, 4, 6, 8, 10, 12
    Soma: .word -1
    Maior: .word -1
    size: .word 14       # Tamanho do vetor

.text
.globl _start

_start:
    la a0, Vetor         # Carregar endereço do vetor
    lw a1, size          # Carregar tamanho do vetor
    jal ra, soma_e_max   # Chamar a função
    la a2, Soma          # Carregar endereço de Soma
    sw a0, 0(a2)         # Armazenar soma em Soma
    la a2, Maior         # Carregar endereço de Maior
    sw a1, 0(a2)         # Armazenar máximo em Maior
    li a7, 10            # Chamada de sistema para sair
    ecall

soma_e_max:
    addi sp, sp, -8      # Decrementar ponteiro de pilha para fazer espaço para 2 itens
    sw ra, 4(sp)         # Salvar endereço de retorno
    sw a1, 0(sp)         # Salvar tamanho

    li t0, 0             # Inicializar soma como 0
    lw t1, 0(a0)         # Inicializar máximo como o primeiro elemento
    addi t2, a0, 4       # Definir ponteiro para o segundo elemento
    li t3, 1             # Inicializar índice i como 1

loop:
    beq t3, a1, fim_loop # Se i == tamanho, fim do loop
    lw t4, 0(t2)         # Carregar elemento atual
    add t0, t0, t4       # Adicionar à soma
    blt t1, t4, atualizar_max # Se elemento atual > máximo, atualizar máximo
atualizar_max:
    mv t1, t4
    addi t2, t2, 4       # Mover para o próximo elemento
    addi t3, t3, 1       # Incrementar índice i
    j loop               # Repetir loop

fim_loop:
    mv a0, t0            # Definir valor de retorno para soma
    mv a1, t1            # Definir valor de retorno para máximo
    lw ra, 4(sp)         # Restaurar endereço de retorno
    lw a1, 0(sp)         # Restaurar tamanho
    addi sp, sp, 8       # Restaurar ponteiro de pilha
    jr ra                # Retornar
