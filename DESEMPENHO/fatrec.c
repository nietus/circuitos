#include <stdio.h>
#include <stdlib.h>

long long int fatorial_recursivo(int n) {
    if (n == 0) return 1;
    return n * fatorial_recursivo(n - 1);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: %s <numero>\n", argv[0]);
        return 1;
    }
    int n = atoi(argv[1]);
    printf("Fatorial de %d é %lld\n", n, fatorial_recursivo(n));
    return 0;
}
