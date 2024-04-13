#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "../include/client.h"

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: %s <number>\n", argv[0]);
        return 1;
    }

    int n = atoi(argv[1]);
    if (n < 0) {
        printf("Error: <number> must be positive\n");
        return 1;
    }

    return run_client(n);
}
