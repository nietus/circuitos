#include <stdio.h>
#include <stdlib.h>

unsigned long long int factorial(unsigned long long int n) {
    unsigned long long int result = 1;
    for (unsigned long long int i = 1; i <= n; ++i) {
        result *= i;
    }
    return result;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <number>\n", argv[0]);
        return 1;
    }

    unsigned long long int num = atoll(argv[1]);
    unsigned long long int result = factorial(num);
    printf("Fatorial de %llu é %llu\n", num, result);

    return 0;
}
