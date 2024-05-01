# Programa 15
# Compile o código abaixo em assembly. Use qualquer mapeamento de variáveis em registradores, seguindo a convenção.
# int a = um_valor_inteiro_qualquer;
# int b = um_valor_inteiro_qualquer;
# int x = 0;
# if ( a >= 0 && b <= 50 ) 
#     x = 1;

.data
a: .word 30
b: .word 20
x: .word 0
.text
.globl _start
_start:
    la t0, a
    la t1, b
    la t2, x
    li t3, 50
    lw s0, 0(t0)
    lw s1, 0(t1) 
    lw s2, 0(t2)
    beq s0, x0, b_match # a == 0
    bgt s0, x0, b_match # a > 0
    j end

b_match:
    beq s2, t3, x_1
    blt s2, t3, x_1
    j end

x_1:
    li t3, 1
    sw t3, 0(t2)

end:
    nop