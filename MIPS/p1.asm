# Programa 1
# Considere o seguinte procedimento C:

# swap(int v[], int k) {
#   int temp;
#   temp = v[k];
#   v[k] = v[k+1];
#   v[k+1] = temp;
# }
# Escreva o código MIPS para o procedimento (assuma que o registrador $t0 é associado à variável temp). Considere que o registo $a0 contém o endereço do elemento v[0] e que o registo $a1 contém o valor da variável k. Se necessário, crie esse espaço de dados em .data para testes.
# Em seguida, reescreva o procedimento, utilizando as convenções de registradores e note as diferenças em relação ao número de instruções utilizado nos dois programas.

# Registradores:
# $a0 - endereço base do array v
# $a1 - índice k
# $t0 - variável temp

.data
    Vetor: .word 1, 2, 3, 4, 5, 6  # Vetor de exemplo
    k: .word 2                    # Valor de k de exemplo

.text
.globl main

# Programa principal para testar a função de troca
main:
    la $a0, Vetor                 # Carregar endereço do vetor em $a0
    lw $a1, k                     # Carregar k em $a1
    jal swap                      # Chamar função de troca
    j end                         # Pular para fim para sair

# Usando Convenções
swap:
    addi $sp, $sp, -12            # Alocar espaço na pilha
    sw $ra, 8($sp)                # Salvar endereço de retorno
    sw $a0, 4($sp)                # Salvar endereço do vetor
    sw $a1, 0($sp)                # Salvar k

    sll $t1, $a1, 2               # $t1 = k * 4 (tamanho da palavra)
    add $t2, $a0, $t1             # $t2 = &v[k]
    lw $t0, 0($t2)                # temp = v[k]
    lw $t3, 4($t2)                # $t3 = v[k+1]
    sw $t3, 0($t2)                # v[k] = v[k+1]
    sw $t0, 4($t2)                # v[k+1] = temp

    lw $ra, 8($sp)                # Restaurar endereço de retorno
    lw $a0, 4($sp)                # Restaurar endereço do vetor
    lw $a1, 0($sp)                # Restaurar k
    addi $sp, $sp, 12             # Desalocar espaço na pilha
    jr $ra                        # Retornar

end:
    li $v0, 10                    # Chamada de sistema para sair
    syscall
