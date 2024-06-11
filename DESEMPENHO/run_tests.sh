#!/bin/bash

# Teste com time para os programas de fatorial
for i in {20..25}; do
    echo "Executando fatorial_recursivo com entrada $i"
    time ./fatorial_recursivo $i
    echo "Executando fatorial_iterativo com entrada $i"
    time ./fatorial_iterativo $i
done

# Teste com perf para os programas de fatorial
for i in {20..25}; do
    echo "Executando perf com fatorial_recursivo e entrada $i"
    perf stat -d ./fatorial_recursivo $i
    echo "Executando perf com fatorial_iterativo e entrada $i"
    perf stat -d ./fatorial_iterativo $i
done

# Teste com perf para divisões de inteiros
echo "Executando perf com divisao_inteiros"
perf stat -d ./divisao_inteiros

# Teste com perf para divisões de floats
echo "Executando perf com divisao_float"
perf stat -d ./divisao_float

# Teste com perf para operações em arquivo
echo "Executando perf com operacoes_arquivo"
perf stat -d ./operacoes_arquivo
