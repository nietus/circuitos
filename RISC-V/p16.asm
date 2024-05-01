# Programa 16
# Substitua o código abaixo em assembly. As variáveis temp e x devem ser armazenadas nos registradores s0 e s1 respectivamente.
# switch(temp){
#     case 10:
#         x = 10;
#         break;
#     case 25:
#         x = 25;
#         break;
#     default:
#         x = 0;
# }

.data
temp: .word 25
x: .word 0

.text
.globl _start
_start:
    # Carregar endereços das variáveis em registradores
    la t0, temp
    la t1, x
    
    # Carregar valores das variáveis em registradores
    lw s0, 0(t0)  # Carregar valor de temp em s0
    
    # Switch-case
    li t2, 10      # Caso 10
    beq s0, t2, case_10   # Se temp == 10, vá para case_10
    li t2, 25      # Caso 25
    beq s0, t2, case_25   # Se temp == 25, vá para case_25

    # Caso padrão (default)
    li t2, 0       # x = 0
    sw t2, 0(t1)   # Armazenar 0 em x
    j end_switch   # Ir para o final do switch-case

case_10:
    # Caso 10: x = 10
    li t2, 10      # Valor 10
    sw t2, 0(t1)   # Armazenar 10 em x
    j end_switch   # Ir para o final do switch-case

case_25:
    # Caso 25: x = 25
    li t2, 25      # Valor 25
    sw t2, 0(t1)   # Armazenar 25 em x

end_switch:
    nop