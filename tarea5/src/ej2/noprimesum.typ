// Somewhat fast implementation of primality test
#let is-prime(n) = {
  if n == 2 or n == 3 {
    return true
  }

  if n < 2 or calc.rem(n, 2) == 0 {
    return false
  }

  if n < 9 {
    return true
  }

  if calc.rem(n, 3) == 0 {
    return false
  }

  let root = calc.sqrt(n)
  let f = 5
  while f <= root {
    if calc.rem(n, f) == 0 or calc.rem(n, f + 2) == 0 {
      return false
    }

    f += 6
  }

  return true
}

#let no-prime-sum(C) = {
  let n = C.len()

  // Graph is an adjacency map
  let G_C = (:)
  for i in C {
    G_C.insert(str(i), ())
  }

  for i in range(n) {
    for j in range(i + 1, n) {
      let sum = C.at(i) + C.at(j)
      if is-prime(sum) {
        G_C.at(str(C.at(i))).push(C.at(j))
        G_C.at(str(C.at(j))).push(C.at(i))
      }
    }
  }

  G_C
}

#no-prime-sum((1, 2, 3))
