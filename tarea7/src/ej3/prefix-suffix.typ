// Gets the largest substring T of the given string S such that T is both a
// prefix and a suffix of S, and T != S. If no such substring exists, returns
// a lambda characte (representing the empty string).
#let prefix-suffix(S) = {
  if S.len() == 0 {
    return $lambda$;
  }

  // Build the table
  let n = S.len();
  let table = (0,) * n;

  let i = 0;
  let j = 1;
  while j < n {
    if S.at(i) != S.at(j) {
      if i == 0 {
        j += 1;
      } else {
        i = table.at(i - 1);
      }

      continue;
    }

    i += 1;
    table.at(j) = i;
    j += 1;
  }

  return if table.last() == 0 {
    $lambda$
  } else {
    S.slice(0, table.last())
  };
}

