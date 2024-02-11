#!/usr/bin/env bash

# Returns the number of good sub-arrays of the passed array
function good_arrays {
    A=("$@")
    local n=${#A[@]}

    C1=( $(for i in $(seq $n); do echo 1; done) )
    local result=$n

    for j in $(seq 2 $n); do
        local C0=( "${C1[@]}" )
        C1=( $(for i in $(seq $n); do echo 0; done) )

        local acc=0
        for i in $(seq 0 $(($n-1))); do
            if [ $i -ge $(($j-1)) ] && [ $((${A[$i]} % $j)) -eq 0 ]; then
                C1[$i]=$acc
                result=$(($result+$acc))
            fi
            acc=$(($acc+${C0[$i]}))
        done

    done

    return $result
}

good_arrays $@
echo $?
