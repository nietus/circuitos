#!/bin/bash
gcc fatrec.c -o fatrec && gcc fat.c -o fat && gcc integers.c -o integers &&  gcc floating.c  -o floating && gcc wfile.c -o wfile
# Teste com time para os programas de fatorial
for i in 10 20 30 40 50 60 70 80 90 100; do
    echo "Executando fatrec com entrada $i"
    time ./fatrec $i
    echo "Executando fat com entrada $i"
    time ./fat $i
done

# Teste com perf para os programas de fatorial
for i in 10 20 30 40 50 60 70 80 90 100; do
    echo "Executando perf com fatrec e entrada $i"
    perf stat -d ./fatrec $i
    echo "Executando perf com fat e entrada $i"
    perf stat -d ./fat $i
done

# Teste com perf para divisões de inteiros
echo "Executando perf com divisao_inteiros"
perf stat -d ./integers

# Teste com perf para divisões de floats
echo "Executando perf com divisao_float"
perf stat -d ./floating

# Teste com perf para operações em arquivo
echo "Executando perf com operacoes_arquivo"
perf stat -d ./wfile