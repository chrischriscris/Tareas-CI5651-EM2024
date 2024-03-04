#!/usr/bin/env bash

time utils/verify.py $@ > /tmp/solbuena.txt
time ./src/main.lua $@ > /tmp/solmala.txt

diff /tmp/solbuena.txt /tmp/solmala.txt
