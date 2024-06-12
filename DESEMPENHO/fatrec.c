#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_DIGITS 5000

void multiply(int result[], int *result_size, int x) {
    int carry = 0;
    for (int i = 0; i < *result_size; ++i) {
        int prod = result[i] * x + carry;
        result[i] = prod % 10;
        carry = prod / 10;
    }

    while (carry) {
        result[(*result_size)++] = carry % 10;
        carry /= 10;
    }
}

void factorial_recursive(int result[], int *result_size, int n) {
    if (n == 1) {
        return;
    }

    factorial_recursive(result, result_size, n - 1);
    multiply(result, result_size, n);
}

void print_result(int result[], int result_size) {
    for (int i = result_size - 1; i >= 0; --i) {
        printf("%d", result[i]);
    }
    printf("\n");
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <number>\n", argv[0]);
        return 1;
    }

    int num = atoi(argv[1]);
    if (num < 0) {
        printf("Please enter a non-negative integer.\n");
        return 1;
    }

    int result[MAX_DIGITS];
    memset(result, 0, sizeof(result));
    result[0] = 1;
    int result_size = 1;

    factorial_recursive(result, &result_size, num);

    print_result(result, result_size);

    return 0;
}
