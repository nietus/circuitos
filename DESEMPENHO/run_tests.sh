#!/bin/bash

# Function to run time command and save output
run_time() {
    echo "Running time for $1 with argument $2"
    time ./$1 $2 2>&1 | tee time_${1}_${2}.txt
}

# Function to run perf command and save output
run_perf() {
    echo "Running perf for $1 with argument $2"
    perf stat -d ./$1 $2 2>&1 | tee perf_${1}_${2}.txt
}

# Run tests for fatorial_recursivo
for i in {20..25}; do
    run_time "fatorial_recursivo" $i
    run_perf "fatorial_recursivo" $i
done

# Run tests for fatorial_iterativo
for i in {20..25}; do
    run_time "fatorial_iterativo" $i
    run_perf "fatorial_iterativo" $i
done

# Run tests for divisao_inteiros
run_perf "divisao_inteiros" 0

# Run tests for divisao_float
run_perf "divisao_float" 0

# Run tests for operacoes_arquivo
run_perf "operacoes_arquivo" 0

# Keep the container running to inspect the results
# tail -f /dev/null