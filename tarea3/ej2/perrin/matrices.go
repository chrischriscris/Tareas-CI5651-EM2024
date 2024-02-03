package main

import ("math/big")

// Multiply two matrices A and B
func MatMul(A[][]*big.Int, B[][]*big.Int) [][]*big.Int {
    n, m, p := len(A), len(B), len(B[0])

    C := make([][]*big.Int, n)
    for i := 0; i < n; i++ {
        C[i] = make([]*big.Int, p)

        for j := 0; j < p; j++ {
            C[i][j] = big.NewInt(0)
            for k := 0; k < m; k++ {
                C[i][j].Add(C[i][j], new(big.Int).Mul(A[i][k], B[k][j]))
            }
        }
    }

    return C
}

// Raise matrix A to the power n using fast exponentiation
func MatPow(A[][]*big.Int, n int) [][]*big.Int {
    if n == 1 {
        return A
    }

    if n % 2 == 0 {
        B := MatPow(A, n / 2)
        return MatMul(B, B)
    }

    return MatMul(A, MatPow(A, n - 1))
}
