<?php
require_once 'BipartiteGraph.php';
require_once 'HopcroftKarp.php';
require_once 'utils.php';

/**
 * Given a list of integers, return the minimum number of integers that can be
 * removed so that doesn't exist any pair of integers on the remaining list
 * that add up to a prime number.
 * @param array $arr
 * @return int
 */
function noPrimeSum(array $arr): int {
    $o = [];
    $e = [];
    $r = 0;

    foreach ($arr as $i) {
        if ($i == 1) {
            $r++;
            continue;
        }

        if ($i % 2 == 0) {
            $e[] = $i;
        } else {
            $o[] = $i;
        }
    }

    $g = new BipartiteGraph($o, $e);
    foreach ($o as $i) {
        foreach ($e as $j) {
            if (isPrime($i + $j)) {
                $g->addEdge($i, $j);
            }
        }
    }

    $solver = new HopcroftKarp($g);
    return $solver->maxMatching() + $r;
}

