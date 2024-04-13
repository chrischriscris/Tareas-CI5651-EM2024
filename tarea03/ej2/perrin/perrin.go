package main

import (
	"math/big"
)

// Computes the n-th Perrin number using naive iteration
func PerrinNaiveIter(n int) *big.Int {
	a := big.NewInt(3)
	b := big.NewInt(0)
	c := big.NewInt(2)

	for i := 3; i <= n; i++ {
		a, b, c = b, c, new(big.Int).Add(a, b)
	}

	return c
}

// Computes the n-th Perrin number using fast matrix exponentiation
func Perrin(n int) *big.Int {
	if n == 0 {
		return big.NewInt(3)
	}

	if n == 1 {
		return big.NewInt(0)
	}

	if n == 2 {
		return big.NewInt(2)
	}

	// P = |0 1 1|
	//     |1 0 0|
	//     |0 1 0|
	P := make([][]*big.Int, 3)
	P[0] = []*big.Int{big.NewInt(0), big.NewInt(1), big.NewInt(1)}
	P[1] = []*big.Int{big.NewInt(1), big.NewInt(0), big.NewInt(0)}
	P[2] = []*big.Int{big.NewInt(0), big.NewInt(1), big.NewInt(0)}

	// P^(n-2)
	power := MatPow(P, n-2)

	// c = 2P[0][0] + 3P[0][2]
	c := new(big.Int).Mul(power[0][0], big.NewInt(2))
	c.Add(c, new(big.Int).Mul(power[0][2], big.NewInt(3)))

	return c
}
