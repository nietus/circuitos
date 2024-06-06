#include <stdio.h>

int main() {
    FILE *file = fopen("resultados.txt", "w");
    if (file == NULL) {
        printf("Erro ao abrir o arquivo!\n");
        return 1;
    }

    for (int i = 1; i <= 1000000; i++) {
        int resultado = i / 2;  // Exemplo de operação
        fprintf(file, "Resultado %d: %d\n", i, resultado);
    }

    fclose(file);
    return 0;
}
