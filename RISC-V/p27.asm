# Programa 27 (No slide Teorica 09)
# Escreva uma função chamada busca_caractere que verifica se uma cadeia de caracteres terminada em zero possui um determinado caractere.
# ● Entrada:
# - a0: endereço inicial da cadeia
# - a1: caractere a ser procurado
# ● Retorna (em a0):
# - endereço da primeira posição da cadeia onde a letra ocorre; ou
# - o valor zero, caso não seja encontrado.
# Programa 27
# Função que verifica se uma cadeia de caracteres terminada em zero possui um determinado caractere

.data
    string: .asciiz "Exemplo de string"  # Cadeia de caracteres de exemplo
    char_to_find: .byte 'f'              # Caractere a ser procurado

.text
.globl _start

_start:
    la a0, string       # Carrega o endereço inicial da cadeia em a0
    lb a1, char_to_find # Carrega o caractere a ser procurado em a1
    jal ra, busca_caractere  # Chama a função busca_caractere

    # A função busca_caractere retorna o resultado em a0
    # Se a0 for zero, o caractere não foi encontrado, caso contrário, a0 é o endereço da primeira ocorrência

    # Encerrar o programa
    li a7, 10
    ecall

busca_caractere:
laco:
    lbu t1, 0(a0)      # Carrega o caractere atual
    beq t1, zero, nao_enc  # Caso seja zero, retorna nao encontrou
    beq t1, a1, encontrou  # Caso seja igual ao caractere de interesse, retorne o endereço em a0
    addi a0, a0, 1     # Caso contrário, avança com o apontador a0
    j laco

nao_enc:
    li a0, 0           # Carrega zero em a0 (caractere não encontrado)
    ret                # Retorna

encontrou:
    ret                # Retorna (endereço já está em a0)
