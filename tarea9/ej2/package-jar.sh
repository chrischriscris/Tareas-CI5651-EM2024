#!/usr/bin/env bash

cd inverseChecker
mvn package -q
mv target/inverseChecker-1.0.jar ../InverseChecker.jar
