#!/usr/bin/env bash

for ((i=1; i<=25000; ++i)); do
  # Generate two random numbers between 1 and 100000
  a=$(shuf -i 1-100000 -n 1)
  b=$(shuf -i 1-100000 -n 1)

  # Ensure a is less than b by swapping if needed
  if [[ $a -gt $b ]]; then
    temp=$a
    a=$b
    b=$temp
  fi

  # Print the pair of numbers
  echo "$a $b"
done

