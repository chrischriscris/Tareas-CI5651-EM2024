package main

import (
    "fmt"
    "os"
)

// Gets a number n from command line and prints the n-th Perrin number
func main() {
    var n int
    fmt.Sscanf(os.Args[1], "%d", &n)

    if n < 0 {
        fmt.Println("n must be a non-negative number")
        return
    }

    fmt.Println(Perrin(n))
    // fmt.Println(PerrinNaiveIter(n))
}
