<?php
require_once 'noPrimeSum.php';

/**
 * Entry point for solving the problem of removing the minimum number of integers
 * from a list so that no pair of integers on the remaining list adds up to a
 * prime number.
 * Receives the list of integers as command line arguments.
 */
function main() {
    global $argv, $argc;

    if ($argc < 2) {
        echo "Usage: " . $argv[0] . " <list of integers>\n";
        exit(1);
    }

    $arr = array_map('intval', array_slice($argv, 1));

    echo noPrimeSum($arr) . "\n";
}

main();
