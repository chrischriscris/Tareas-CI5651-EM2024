<?php
function isPrime(int $n): bool {
    if ($n == 2 || $n == 3) {
        return true;
    }

    if ($n < 2 || $n % 2 == 0) {
        return false;
    }

    if ($n < 9) {
        return true;
    }

    if ($n % 3 == 0) {
        return false;
    }

    $root = (int) sqrt($n);
    $f = 5;
    while ($f <= $root) {
        if ($n % $f == 0 || $n % ($f + 2) == 0) {
            return false;
        }

        $f += 6;
    }

    return true;
}
