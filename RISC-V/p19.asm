# Programa 19
# Compile para o assembly do RISC-V o código a seguir:
# int i;
# int A[10];
# for (i=0; i<10; i++) {
#    if (i%2==0)
#      A[i]=A[i]+A[i+1];
#    else 
#      A[i]=A[i]*2;
# }

.data
i: .word 0
offset: .word 0
A: .word 1,2,3,4,5,6,7,8,9,10

.text
.globl _start

_start:
    la t0, i
    la t1, offset
    la t2, A

loop:
    li s0, 10
    lw s1, 0(t0)  # Load the value of i

    # if i >= 10, exit loop
    beq s1, s0, end_loop
    bgt s1, s0, end_loop

    # if i < 10
    # if i % 2 == 0
    andi t6, s1, 1
    beqz t6, par
    
    # else (impar)
    j impar

par:
    lw s2, 0(t1)    # offset
    add s10, s2, t2 # s10 fica o endereco q queremos acessar (t1 + offset)
    lw s3, 0(s10)   # A no offset s2
    lw s4, 4(s10)   # A no offset s2 + 1 (4 bytes)
    add s3, s3, s4  # a[i] + a[i + 1]
    sw s3, 0(s10)   # guarda o valor novo no endereço + offset
    addi s2, s2, 4  # soma 4 no registrador de offset
    sw s2, 0(t1)    # guarda o valor do prox offset
    addi s1, s1, 1  # adiciona 1 no i
    sw s1, 0(t0)    # atualiza o valor do i
    j loop

impar:
    lw s2, 0(t1)    # offset
    add s10, s2, t2 # s10 fica o endereco q queremos acessar (t1 + offset)
    lw s3, 0(s10)   # A no offset s2
    slli s3, s3, 1  # A * 2
    sw s3, 0(s10)   # guarda o valor novo no endereço + offset
    addi s2, s2, 4  # soma 4 no registrador de offset
    sw s2, 0(t1)    # guarda o valor do prox offset
    addi s1, s1, 1  # adiciona 1 no i
    sw s1, 0(t0)    # atualiza o valor do i
    j loop

end_loop:
    nop