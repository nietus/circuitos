# Programa 24
# Lê o vetor, calcula a soma dos elementos, encontra o maior valor e armazena os resultados

.data
    Vetor: .word 1, 3, 5, 7, 9, 11, 13, 0, 2, 4, 6, 8, 10, 12
    Soma: .word -1
    Maior: .word -1
    Tamanho: .word 14  # Tamanho do vetor

.text
.globl _start

_start:
    la t0, Vetor       # Carrega o endereço base do vetor em t0
    lw t1, Tamanho     # Carrega o tamanho do vetor em t1
    li t2, 0           # Inicializa a soma em 0
    li t3, -2147483648 # Inicializa o maior valor com o menor inteiro possível

loop:
    beqz t1, fim       # Se o tamanho for 0, termina o loop

    lw t4, 0(t0)       # Carrega o valor atual do vetor em t4
    add t2, t2, t4     # Adiciona o valor atual à soma

    # Verifica se o valor atual é maior que o maior valor encontrado até agora
    bgt t4, t3, atualiza_maior
    j proximo

atualiza_maior:
    mv t3, t4          # Atualiza o maior valor

proximo:
    addi t0, t0, 4     # Avança para o próximo elemento do vetor
    addi t1, t1, -1    # Decrementa o contador do tamanho
    j loop             # Repete o loop

fim:
    # Armazena a soma no local apropriado
    la t5, Soma
    sw t2, 0(t5)

    # Armazena o maior valor no local apropriado
    la t6, Maior
    sw t3, 0(t6)

    # Finaliza o programa
    li a7, 10
    ecall
