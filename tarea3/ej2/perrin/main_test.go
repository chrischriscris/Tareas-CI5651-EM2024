package main

import (
    "fmt"
    "testing"
)

var inputs = []int{0, 1, 2, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6}

func BenchmarkPerrin(b *testing.B) {
    for _, n := range inputs {
        b.Run (fmt.Sprintf("Perrin(%d)", n), func(b *testing.B) {
            for i := 0; i < b.N; i++ {
                Perrin(n)
            }
        })
    }
}

func BenchmarkPerrinNaiveIter(b *testing.B) {
    for _, n := range inputs {
        b.Run (fmt.Sprintf("PerrinNaiveIter(%d)", n), func(b *testing.B) {
            for i := 0; i < b.N; i++ {
                PerrinNaiveIter(n)
            }
        })
    }
}
