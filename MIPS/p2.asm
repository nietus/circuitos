# Programa 2
# Considere o seguinte procedimento C, o qual calcula o maior elemento de um vetor v com n elementos.

# int maximo(int v[], int n) {
#   int max = v[0];
#   for(i = 1; i < n; i++) {
#     if (v[i] > max) max = v[i];
#   } 
# }
# Escreva o código MIPS correspondente.

# Uso dos registradores:
# $a0 - endereço base do array (v)
# $a1 - número de elementos no array (n)
# $t0 - índice do loop (i)
# $t1 - valor máximo atual (max)
# $t2 - elemento atual do array (v[i])
# $t3 - endereço temporário para acesso ao array

.data
    Vetor: .word 1, 3, 5, 7, 9, 11, 13, 0, 2, 4, 6, 8, 10, 12
    size: .word 14                # Tamanho do vetor
    resultado: .word 0

.text
.globl main

main:
    la $a0, Vetor                 # Carregar endereço do vetor
    lw $a1, size                  # Carregar tamanho do vetor
    jal maximo                    # Chamar maximo
    sw $v0, resultado             # Armazenar máximo em resultado
    j end                         # Sair do programa

maximo:
    addi $sp, $sp, -8             # Decrementar ponteiro de pilha para fazer espaço para 2 itens
    sw $ra, 4($sp)                # Salvar endereço de retorno
    sw $a1, 0($sp)                # Salvar tamanho

    lw $t0, 0($a0)                # Inicializar máximo como o primeiro elemento
    addi $t1, $a0, 4              # Definir ponteiro para o segundo elemento
    addi $t2, $zero, 1            # Inicializar índice i como 1

loop:
    beq $t2, $a1, end_loop        # Se i == tamanho, fim do loop
    lw $t3, 0($t1)                # Carregar elemento atual
    ble $t3, $t0, skip            # Se elemento atual <= máximo, pular
    move $t0, $t3                 # Atualizar máximo
skip:
    addi $t1, $t1, 4              # Mover para o próximo elemento
    addi $t2, $t2, 1              # Incrementar índice i
    j loop                        # Repetir loop

end_loop:
    move $v0, $t0                 # Definir valor de retorno para máximo
    lw $ra, 4($sp)                # Restaurar endereço de retorno
    lw $a1, 0($sp)                # Restaurar tamanho
    addi $sp, $sp, 8              # Restaurar ponteiro de pilha
    jr $ra                        # Retornar

end:
    li $v0, 10                    # Chamada de sistema para sair
    syscall