# Programa 8
# Considere a seguinte instrução iniciando um programa:
# Usando apenas instruções lógicas e instruções de deslocamento, continue o programa de forma que ao final, tenhamos o seguinte conteúdo no registrador $8:
# x8 = 0xFFFFFFFF

.text
.globl _start

_start:
    li   x8, 0x1   # Inicializa x8 com 0x1
    xori x8, x8, 0x01   # Altera o bit 1 de x8 para 0
    not x8, x8      # Inverte todos os bits de x8 para definir todos os bits como 1
    nop