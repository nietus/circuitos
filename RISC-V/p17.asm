# Programa 17
# Substitua o código abaixo em assembly. As variáveis i e x devem ser armazenadas nos registradores s0 e s1 respectivamente.
# while(i == 8){
#     x = i++;
# } 
# Sai do loop se i != 8 

.data
i: .word 8  # Valor inicial de i
x: .word 0  # Variável x

.text
.globl _main

_main:
    # Carregar endereços das variáveis em registradores
    la t0, i
    la t1, x
    
loop:
    # Carregar valores das variáveis em registradores
    lw s0, 0(t0)  # Carregar valor de i em s0
    
    # Se i != 8, sair do loop
    li t2, 8
    bne s0, t2, exit_loop

    # Se i == 8, o loop continua
    sw s0, 0(t1)    # Atribuir o valor de i a x
    addi s0, s0, 1  # Incrementar i
    sw s0, 0(t0)    # Atualizar o valor de i na memória
    j loop

exit_loop:
    nop