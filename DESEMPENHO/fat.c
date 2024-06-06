#include <stdio.h>
#include <stdlib.h>

long long int fatorial_iterativo(int n) {
    long long int resultado = 1;
    for (int i = 1; i <= n; i++) {
        resultado *= i;
    }
    return resultado;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: %s <numero>\n", argv[0]);
        return 1;
    }
    int n = atoi(argv[1]);
    printf("Fatorial de %d é %lld\n", n, fatorial_iterativo(n));
    return 0;
}
