#!/usr/bin/env bash

for i in {1..100}
do
  echo $(shuf -i 1-10 -n 1) $(shuf -i 1-10 -n 1)
done
