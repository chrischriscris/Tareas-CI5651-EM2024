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

class HopcroftKarp {
    const INF = 2147483647;
    const NIL = -1;

    private $G;
    private $pair_u;
    private $pair_v;
    private $dist;

    /**
     * Initializes the structures required for the Hopcroft-Karp algorithm.
     * @param BipartiteGraph $G
     */
    public function __construct(BipartiteGraph $G) {
        $this->G = $G;
        $this->pair_u = [];
        $this->pair_v = [];
        $this->dist = [];
    }

    private function bfs(): bool {
        $Q = new SplQueue();

        foreach ($this->pair_u as $u => $v) {
            if ($v == self::NIL) {
                $this->dist[$u] = 0;
                $Q->enqueue($u);
            } else {
                $this->dist[$u] = self::INF;
            }
        }

        $this->dist[self::NIL] = self::INF;

        while (!$Q->isEmpty()) {
            $u = $Q->dequeue();
            if ($this->dist[$u] < $this->dist[self::NIL]) {
                foreach ($this->G->adj[$u] as $v) {
                    if ($this->dist[$this->pair_v[$v]] == self::INF) {
                        $this->dist[$this->pair_v[$v]] = $this->dist[$u] + 1;
                        $Q->enqueue($this->pair_v[$v]);
                    }
                }
            }
        }

        return $this->dist[self::NIL] != self::INF;
    }

    private function dfs(int $u): bool {
        if ($u == self::NIL) {
            return true;
        }

        foreach ($this->G->adj[$u] as $v) {
            if ($this->dist[$this->pair_v[$v]] == $this->dist[$u] + 1 &&
                $this->dfs($this->pair_v[$v])) {
                if ($this->dfs($this->pair_v[$v])) {
                    $this->pair_u[$u] = $v;
                    $this->pair_v[$v] = $u;

                    return true;
                }
            }
        }

        $this->dist[$u] = self::INF;
        return false;
    }

    public function max_matching(): int {
        foreach ($this->G->A as $u) {
            $this->pair_u[$u] = self::NIL;
            $this->dist[$u] = 0;
        }

        foreach ($this->G->B as $v) {
            $this->pair_v[$v] = self::NIL;
        }

        $matching = 0;
        while ($this->bfs()) {
            foreach ($this->pair_u as $u => $v) {
                if ($v == self::NIL && $this->dfs($u)) {
                    $matching++;
                }
            }
        }

        return $matching;
    }
}

/**
 * Represents a bipartite graph as an adjacency list.
 * Stores the partition sets as well.
 */
class BipartiteGraph {
    public $A;
    public $B;
    public $adj;

    /**
     * Initializes the bipartite graph with the given sets of vertices.
     * It is assumed that every edge to be added is either from A to B or from
     * B to A.
     * @param array $A
     * @param array $B
     */
    public function __construct(array $A, array $B) {
        $this->A = $A;
        $this->B = $B;

        $this->adj = [];
    }

    /**
     * Adds an edge from u to v in the graph.
     * @param int $u
     * @param int $v
     */
    public function add_edge(int $u, int $v): void {
        $this->adj[$u][] = $v;
    }
}

function no_prime_sum(array $arr): int {
    $n = count($arr);

    $O = [];
    $E = [];

    foreach ($arr as $i) {
        if ($i % 2 == 0) {
            $E[] = $i;
        } else {
            $O[] = $i;
        }
    }

    $G_C = new BipartiteGraph($O, $E);

    foreach ($O as $i) {
        foreach ($E as $j) {
            if (isPrime($i + $j)) {
                $G_C->add_edge($i, $j);
            }
        }
    }

    $solver = new HopcroftKarp($G_C);

    return $solver->max_matching();
}

// Driver program
function main() {
    global $argv, $argc;

    if ($argc < 2) {
        echo "Usage: " . $argv[0] . " <list of integers>\n";
        exit(1);
    }

    $arr = array_map('intval', array_slice($argv, 1));

    echo no_prime_sum($arr) . "\n";
}

main();

