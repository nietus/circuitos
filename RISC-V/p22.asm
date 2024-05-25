# Programa 22
# Fatorial recursivo em RISC-V

.data
    fact_result: .word 0  # espaço para o resultado

.text
    .globl _start

_start:
    li a0, 5        # Carregar o valor 5 em a0 (Calcular o fatorial de 5)
    jal ra, fact    # Chamar a função fact
    la t0, fact_result  # Carregar o endereço de fact_result em t0
    sw a0, 0(t0)    # Armazenar o resultado em fact_result

    # Encerrar o programa
    li a7, 10
    ecall

fact:
    li t0, 1        # t0 = 1

    beq a0, t0, fact_base_case  # se n == 1, retorna 1

    addi sp, sp, -4  # decrementa o ponteiro da pilha
    sw ra, 0(sp)     # salva ra na pilha

    addi sp, sp, -4  # decrementa o ponteiro da pilha para salvar a0
    sw a0, 0(sp)     # salva a0 na pilha

    addi a0, a0, -1  # n = n - 1
    jal ra, fact     # fact(n-1)

    lw t1, 0(sp)     # restaura o valor original de a0 da pilha
    addi sp, sp, 4   # incrementa o ponteiro da pilha

    mul a0, a0, t1   # fact(n) = n * fact(n-1)

    lw ra, 0(sp)     # restaura ra da pilha
    addi sp, sp, 4   # incrementa o ponteiro da pilha
    jr ra            # retorna

fact_base_case:
    li a0, 1
    jr ra