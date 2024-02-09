#include "../include/client.h"
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int run_client(int n) {
    char command[32];
    const char delim[] = " ";
    char *token;

    int ctr = 0;
    int *T = (int *)malloc(n * sizeof(int));
    if (T == NULL) {
        printf("Error: Memory allocation failed\n");
        return 1;
    }

    int *a = (int *)malloc(n * sizeof(int));
    if (a == NULL) {
        printf("Error: Memory allocation failed\n");
        return 1;
    }

    int *b = (int *)malloc(n * sizeof(int));
    if (b == NULL) {
        printf("Error: Memory allocation failed\n");
        return 1;
    }

    while (true) {
        scanf("%[^\n]%*c", command);
        token = strtok(command, delim);

        // ASIGNAR <pos> <val>
        if (strcmp(token, "ASIGNAR") == 0) {
            int pos = atoi(strtok(NULL, delim));
            int val = atoi(strtok(NULL, delim));

            if (pos < 0 || pos >= n) {
                printf("Error: Invalid position\n");
                continue;
            }

            T[pos] = val;
            a[ctr] = pos;
            b[pos] = ctr++;
        }

        // CONSULTAR <pos>
        else if (strcmp(token, "CONSULTAR") == 0) {
            int pos = atoi(strtok(NULL, delim));
            if (pos < 0 || pos >= n) {
                printf("Error: Invalid position\n");
                continue;
            }

            if (b[pos] < ctr && a[b[pos]] == pos) {
                printf("%d\n", T[pos]);
            } else {
                printf("NULL\n");
            }
        }

        // LIMPIAR
        else if (strcmp(token, "LIMPIAR") == 0) {
            ctr = 0;
        }

        // SALIR
        else if (strcmp(token, "SALIR") == 0) {
            break;
        } else {
            printf("Error: Invalid command\n");
        }
    }

    return 0;
}
