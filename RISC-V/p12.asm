# Programa 12
# Considere o trecho de código a seguir, e compile esse código em assembly:
# int A[] = {1,3,5,7,9};
# int B[] = {2,4,6,8,10};
# A[0] = B[0] * 1 + A[0];
# A[1] = B[1] * 2 + A[1];
# A[2] = B[2] * 3 + A[2];
# A[3] = B[3] * 4 + A[3];
# A[4] = B[4] * 5 + A[4];
# Regra: Usar apenas um registrador para o endereço de A e outro para o endereço de B.

.data
A: .word 1, 3, 5, 7, 9
B: .word 2, 4, 6, 8, 10

.text
.globl _start
_start:
    # Carregar endereço de A e B em registradores
    la t0, A
    la t1, B

    # A[0] = B[0] * 1 + A[0]
    lw t2, 0(t1)      # Carregar B[0] em t2
    lw t3, 0(t0)      # Carregar A[0] em t3
    add t3, t3, t2   # A[0] += B[0]
    sw t3, 0(t0)      # Armazenar A[0] de volta em memória

    # A[1] = B[1] * 2 + A[1]
    lw t2, 4(t1)      # Carregar B[1] em t2
    lw t3, 4(t0)      # Carregar A[1] em t3
    slli t2, t2, 1    # B[1] *= 2
    add t3, t3, t2   # A[1] += B[1]
    sw t3, 4(t0)      # Armazenar A[1] de volta em memória

    # A[2] = B[2] * 3 + A[2]
    lw t2, 8(t1)      # Carregar B[2] em t2
    lw t3, 8(t0)      # Carregar A[2] em t3
    li t4, 3
    mul t2, t2, t4     # B[2] *= 3
    add t3, t3, t2   # A[2] += B[2]
    sw t3, 8(t0)      # Armazenar A[2] de volta em memória

    # A[3] = B[3] * 4 + A[3]
    lw t2, 12(t1)     # Carregar B[3] em t2
    lw t3, 12(t0)     # Carregar A[3] em t3
    li t4, 4
    mul t2, t2, t4     # B[3] *= 4
    add t3, t3, t2   # A[3] += B[3]
    sw t3, 12(t0)     # Armazenar A[3] de volta em memória

    # A[4] = B[4] * 5 + A[4]
    lw t2, 16(t1)     # Carregar B[4] em t2
    lw t3, 16(t0)     # Carregar A[4] em t3
    li t4, 5
    mul t2, t2, t4     # B[4] *= 5
    add t3, t3, t2   # A[4] += B[4]
    sw t3, 16(t0)     # Armazenar A[4] de volta em memória
    nop