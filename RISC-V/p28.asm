# Programa 28 (No slide Teorica 09)
# Escreva um trecho de programa que determina qual o maior valor de um vetor de números inteiros de 32 bits sem sinal cujo endereço inicial é dado em a2.
# Inicialmente, a3 contém o número de valores presentes na cadeia; suponha que o valor em a3 é > 0.
# Ao final do trecho, a0 deve conter o valor máximo e a1 deve conter o endereço de memória onde se encontra o valor máximo.

.data
    Vetor: .word 5, 10, 15, 7, 20, 3, 25  # Exemplo de vetor
    Tamanho: .word 7                      # Tamanho do vetor

.text
.globl _start

_start:
    la a2, Vetor         # Carrega o endereço inicial do vetor em a2
    lw a3, Tamanho       # Carrega o número de valores presentes no vetor em a3
    jal ra, find_max     # Chama a função find_max

    # Após a chamada, a0 conterá o valor máximo e a1 conterá o endereço de memória do valor máximo

    # Encerrar o programa
    li a7, 10
    ecall

find_max:
    lw a0, 0(a2)          # Carrega o primeiro valor do vetor em a0
    mv a1, a2             # Inicializa a1 com o endereço do primeiro valor
    addi a3, a3, -1       # Decrementa a contagem de elementos

laco:
    ble a3, zero, terminei # Se a3 for zero, termina o loop
    addi a2, a2, 4        # Avança para o próximo elemento do vetor
    lw t1, 0(a2)          # Carrega o próximo valor do vetor em t1
    bleu t1, a0, pula_valor # Se t1 <= a0, pula para o próximo valor
    mv a0, t1             # Atualiza a0 com o novo valor máximo
    mv a1, a2             # Atualiza a1 com o endereço do novo valor máximo

pula_valor:
    addi a3, a3, -1       # Decrementa o contador de elementos restantes
    j laco                # Repete o loop

terminei:
    ret                   # Retorna
