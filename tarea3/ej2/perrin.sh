#!/usr/bin/env bash

# Define a function that calculates the nth Perrin number
#
# Usage: perrin.sh n

perrin() {
  if [ $1 -eq 0 ]; then
    echo 3
  elif [ $1 -eq 1 ]; then
    echo 0
  elif [ $1 -eq 2 ]; then
    echo 2
  else
    a=3
    b=0
    c=2
    for i in $(seq 3 $1); do
      # Use bc to perform arbitrary precision arithmetic
      d=$(bc <<< "$a + $b")
      a=$b
      b=$c
      c=$d
    done
    echo $c
  fi
}

perrin $1
