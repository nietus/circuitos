# Programa 1
# Considere o seguinte procedimento C:

# swap(int v[], int k) {
#   int temp;
#   temp = v[k];
#   v[k] = v[k+1];
#   v[k+1] = temp;
# }
# Escreva o código MIPS para o procedimento (assuma que o registrador $t0 é associado à variável temp). Considere que o registo a0 contém o endereço do elemento v[0] e que o registo a1 contém o valor da variável k. Se necessário, crie esse espaço de dados em .data para testes.
# Em seguida, reescreva o procedimento, utilizando as convenções de registradores e note as diferenças em relação ao número de instruções utilizado nos dois programas.

# Registradores:
# a0 - endereço base do array v
# a1 - índice k
# $t0 - variável temp

.data
v: .word 10, 20, 30, 40, 50

.text
.globl main

main:
    # Inicialização para testes
    la $a0, v         # Carrega o endereço de v[0] em $a0
    li $a1, 2         # Carrega o valor de k (2) em $a1

    # Chama o procedimento swap básico
    jal swap_basic

    # Inicialização para testes novamente
    la $a0, v         # Carrega o endereço de v[0] em $a0
    li $a1, 2         # Carrega o valor de k (2) em $a1

    # Chama o procedimento swap com convenções
    jal swap_convention

    # Fim do programa
    li $v0, 10        # Chamada para terminar o programa
    syscall

# Implementação básica do swap
swap_basic:
    # Realiza a troca dos elementos v[k] e v[k+1]
    sll $t1, $a1, 2    # k * 4 (tamanho de palavra) em $t1
    add $t1, $a0, $t1  # Endereço de v[k] em $t1
    lw $t0, 0($t1)     # temp = v[k]
    lw $t2, 4($t1)     # Carrega v[k+1] em $t2
    sw $t2, 0($t1)     # v[k] = v[k+1]
    sw $t0, 4($t1)     # v[k+1] = temp
    jr $ra             # Retorna para a chamada anterior

# Implementação do swap utilizando convenções de registradores
swap_convention:
    # Salva os registradores que serão utilizados
    addi $sp, $sp, -8  # Espaço na pilha
    sw $ra, 4($sp)     # Salva $ra
    sw $s0, 0($sp)     # Salva $s0

    # Realiza a troca dos elementos v[k] e v[k+1]
    move $s0, $a0      # $s0 = $a0 (endereço de v[0])
    sll $t1, $a1, 2    # k * 4 (tamanho de palavra) em $t1
    add $t1, $s0, $t1  # Endereço de v[k] em $t1
    lw $t2, 0($t1)     # $t2 = v[k]
    lw $t3, 4($t1)     # $t3 = v[k+1]
    sw $t3, 0($t1)     # v[k] = v[k+1]
    sw $t2, 4($t1)     # v[k+1] = $t2 (temp)

    # Restaura os registradores
    lw $s0, 0($sp)     # Restaura $s0
    lw $ra, 4($sp)     # Restaura $ra
    addi $sp, $sp, 8   # Libera espaço na pilha

    jr $ra             # Retorna para a chamada anterior