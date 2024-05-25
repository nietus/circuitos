# Programa 21
# Fibonnaci recursivo

.data
    num:    .word   10          # Número de entrada para o qual queremos encontrar o Fibonacci
    result: .word   0           # Para armazenar o resultado

.text
.globl main

main:
    # Carrega o número de entrada em a0
    la   t0, num
    lw   a0, 0(t0)

    # Chama a função fibonacci
    jal  ra, fibonacci

    # Armazena o resultado na variável result
    la   t1, result
    sw   a0, 0(t1)

    # Sai do programa
    li   a0, 10
    ecall

fibonacci:
    addi sp, sp, -12            # Ajusta a pilha para 3 itens
    sw   ra, 8(sp)              # Salva o endereço de retorno
    sw   s0, 4(sp)              # Salva s0
    sw   a0, 0(sp)              # Salva o argumento n

    # Caso base: se n <= 1, retorna n
    li   t2, 1
    bgt  a0, t2, recur_case
    lw   ra, 8(sp)              # Restaura o endereço de retorno
    lw   s0, 4(sp)              # Restaura s0
    addi sp, sp, 12             # Restaura a pilha
    jr   ra                     # Retorna

recur_case:
    # Caso recursivo: fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)
    addi a0, a0, -1             # n-1
    jal  ra, fibonacci          # Chama fibonacci(n-1)
    mv   s0, a0                 # Armazena o resultado de fibonacci(n-1) em s0

    lw   a0, 0(sp)              # Restaura o valor original de n
    addi a0, a0, -2             # n-2
    jal  ra, fibonacci          # Chama fibonacci(n-2)

    add  a0, a0, s0             # fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)

    # Restaura a pilha e retorna
    lw   ra, 8(sp)              # Restaura o endereço de retorno
    lw   s0, 4(sp)              # Restaura s0
    addi sp, sp, 12             # Restaura a pilha
    jr   ra                     # Retorna