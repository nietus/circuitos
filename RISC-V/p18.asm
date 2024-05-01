# Programa 18
# Compile para o assembly do RISC-V o código a seguir:
# int i;
# int A[10];
# for (i=0; i<10; i++) {
#    A[i]=A[i]+1;
# }

.data
i: .word 0
offset: .word 0
A: .word 0,0,0,0,0,0,0,0,0,0

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
    lw s2, 0(t1)    # offset
    add s10, s2, t2 # s10 fica o endereco q queremos acessar (t1 + offset)
    lw s3, 0(s10)   # A no offset s2
    addi s3, s3, 1  # Adiciona 1 no i[a]
    sw s3, 0(s10)   # guarda o valor novo no endereço + offset
    addi s2, s2, 4  # soma 4 no registrador de offset
    sw s2, 0(t1)    # guarda o valor do prox offset
    addi s1, s1, 1  # adiciona 1 no i
    sw s1, 0(t0)    # atualiza o valor do i
    
    j loop  # Jump back to the beginning of the loop

end_loop:
    nop