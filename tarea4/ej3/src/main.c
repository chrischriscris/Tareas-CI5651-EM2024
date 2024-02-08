#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: %s <number>\n", argv[0]);
        return 1;
    }

    int n = atoi(argv[1]);
    if (n < 0) {
        printf("Number must be positive\n");
        return 1;
    }

    char command[100];
    const char delim[] = " ";
    char *token;

    // ASIGNAR <pos> <value>
    // CONSULTAR <pos>
    // LIMPIAR
    // SALIR
    while (true) {
        scanf("%[^\n]", command);

        token = strtok(command, delim);
        if (strcmp(token, "ASIGNAR") == 0) {
            token = strtok(command, delim);
            printf("%s\n", token);
            int pos = atoi(token);

            token = strtok(command, delim);
            int value = atoi(token);
            printf("ASIGNAR %d %d\n", pos, value);

            if (pos < 0 || pos >= n) {
                printf("Invalid position\n");
                continue;
            }
            // Asignar valor
        } else if (strcmp(token, "CONSULTAR") == 0) {
            int pos = atoi(strtok(NULL, delim));
            if (pos < 0 || pos >= n) {
                printf("Invalid position\n");
                continue;
            }
            // Consultar valor
        } else if (strcmp(token, "LIMPIAR") == 0) {
            // Limpiar
        } else if (strcmp(token, "SALIR") == 0) {
            break;
        } else {
            printf("Invalid command\n");
        }
    }

    return 0;
}
