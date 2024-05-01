# Programa 20
# A série de Fibonacci é definida assim: os dois primeiros termos têm o valor 1 e cada termo seguinte é igual à soma dos dois anteriores.
# 1 1 2 3 5 8 13 21 ...
# Escreva um programa em linguagem de montagem, que calcule o valor do 9º termo.

.data
n: .word 9      # Contador-alvo

.text
.globl _start

_start:
    # Inicializa os primeiros termos relevantes (ate o terceiro, excluindo o termo 1)
    li t0, 1   # fibo(1)
    li t1, 2   # fibo(2)

    # Inicializa o contador
    li t2, 3   # começa no 3, pq ja temos valores do fib([0,1,2])

loop:
    # Verifica o contador-alvo ja foi atingido
    lw t3, n   # Carrega o valor de n
    bge t2, t3, end_loop  # Se o contador for maior ou igual a n, saímos do loop

    # Calcula o próximo termo da série de fibo
    add t4, t0, t1  # fibo(n) = fibo(n-1) + fibo(n-2)

    # Atualiza os valores dos termos anteriores
    mv t0, t1       # fibo(n-2) = fibo(n-1)
    mv t1, t4       # fibo(n-1) = fibo(n)

    # Incrementa o contador de termos
    addi t2, t2, 1

    j loop

end_loop:
    mv a0, t1  # Resultado no t1
    nop