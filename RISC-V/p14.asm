# Programa 14
# Substitua o código abaixo em assembly. As variáveis x, y e m devem ser armazenadas nos registradores s0, s1 e s2 respectivamente.
# int x = um_valor_inteiro_qualquer;
# int y = um_valor_inteiro_qualquer;
# int m = 0;
# if (x > y)
#     m = x;
# else
#     m = y;

.data
x: .word 30
y: .word 20
m: .word 0
.text
.globl _start
_start:
    la t0, x
    la t1, y
    la t2, m
    lw s0, 0(t0)
    lw s1, 0(t1) 
    lw s2, 0(t2)
    bgt s0, s1, greater_than   # Se x > y, vá para greater_than
    # Senão, vá para less_than
    j less_than

greater_than:
    # Se x > y, definir m como x
    mv s2, s0          # Mover o valor de x para m
    j end

less_than:
    # Se x <= y, definir m como y
    mv s2, s1          # Mover o valor de y para m
    j end

end:
    nop