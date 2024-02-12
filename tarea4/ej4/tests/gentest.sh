#!/bin/bash

# Set the number of pairs to generate (n)
n=$1

# Validate the input (n must be a positive integer)
if [[ ! "$n" =~ ^[1-9][0-9]*$ ]]; then
  echo "Invalid input. Please enter a positive integer."
  exit 1
fi

# Generate n pairs of random integers
for i in $(seq 1 "$n"); do
  # Generate two random integers between -100 and 100
  num1=$((RANDOM % 201 - 100))
  num2=$((RANDOM % 201 - 100))

  # Echo the pair of integers
  echo "$num1 $num2"
done

