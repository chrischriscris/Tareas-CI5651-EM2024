#!/usr/bin/env python

from sys import argv

def multiswap(A, a, b):
    i, j = a - 1, b - 1
    while i < b - 1 and j < len(A):
        A[i], A[j] = A[j], A[i]
        i += 1
        j += 1

def main():
    n = int(argv[1])
    A = list(range(1, n+1))
    swaps = []
    with open(argv[2], 'r') as f:
        for line in f:
            swaps.append(list(map(int, line.split())))

    for swap in swaps:
        multiswap(A, swap[0], swap[1])

    print(" ".join(map(str, A)), end=" ")
    print()

if __name__ == '__main__':
    main()

