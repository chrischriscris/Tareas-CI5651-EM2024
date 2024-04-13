#!/usr/bin/env python3

from sys import argv

import numpy as np


def main():
    n = int(argv[1])

    # Generate a random n x n matrix with real elements in [-100, 100]
    A = np.random.uniform(-100, 100, (n, n))

    # Print the matrices in the following format:
    # n
    # a11 a12 a13 ... a1n
    # a21 a22 a23 ... a2n
    # ...
    # an1 an2 an3 ... ann

    print(n)
    for i in range(n):
        print(" ".join(map(str, A[i])))

    A_inv = np.linalg.inv(A)
    for i in range(n):
        print(" ".join(map(str, A_inv[i])))


if __name__ == "__main__":
    main()
