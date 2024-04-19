#include <stdio.h>

int main() {
    int opcao = 2;

    switch (opcao) {
        case 1:
            printf("Opcao 1 selecionada.\n");
            break;
        case 2:
            printf("Opcao 2 selecionada.\n");
            break;
        case 3:
            printf("Opcao 3 selecionada.\n");
            break;
        default:
            printf("Opcao invalida.\n");
    }

    return 0;
}