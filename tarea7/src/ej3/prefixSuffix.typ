#let buildKMPTable(string) = {
  let n = string.len();
  let j = -1;

  let table = (0,) * (n + 1);
  table.at(0) = -1;

  let i = calc.ceil(n / 2);
  while i <= n {
    while j >= 0 and string.at(i - 1) != string.at(j) {
      j = table.at(j);
    }

    j += 1;
    table.at(i) = j;
    i += 1;
  }

  return table;
}
