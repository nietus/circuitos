#include <stdio.h>
#include <stdlib.h>

unsigned long long int factorial(unsigned long long int n) {
    if (n == 0)
        return 1;
    else
        return n * factorial(n - 1);
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
