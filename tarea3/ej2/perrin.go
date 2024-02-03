package main

import (
    "fmt"
    "os"
    "math/big"
)

// MatMul multiplies two matrices
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

func perrin(n int) *big.Int {
    if n == 0 {
        return big.NewInt(3)
    }

    if n == 1 {
        return big.NewInt(0)
    }

    if n == 2 {
        return big.NewInt(2)
    }

    // P = [0 1 1; 1 0 0; 0 1 0]
    P := make([][]*big.Int, 3)
    P[0] = []*big.Int{big.NewInt(0), big.NewInt(1), big.NewInt(1)}
    P[1] = []*big.Int{big.NewInt(1), big.NewInt(0), big.NewInt(0)}
    P[2] = []*big.Int{big.NewInt(0), big.NewInt(1), big.NewInt(0)}

    power := MatPow(P, n - 2)

    // c = 2P[0][0] + 3P[0][2]
    c := new(big.Int).Mul(power[0][0], big.NewInt(2))
    c.Add(c, new(big.Int).Mul(power[0][2], big.NewInt(3)))

    return c
}

func main() {
    // Gets a number from argv
    var n int

    fmt.Sscanf(os.Args[1], "%d", &n)
    fmt.Println(perrin(n))
}
