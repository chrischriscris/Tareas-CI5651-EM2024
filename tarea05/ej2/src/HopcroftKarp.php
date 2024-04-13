<?php
class HopcroftKarp {
    const INF = 2147483647;
    const NIL = -1;

    private $g;
    private $pairU;
    private $pairV;
    private $dist;

    /**
     * Initializes the structures required for the Hopcroft-Karp algorithm.
     * @param BipartiteGraph $g
     */
    public function __construct(BipartiteGraph $g) {
        $this->g = $g;
        $this->pairU = [];
        $this->pairV = [];
        $this->dist = [];
    }

    /**
     * Modified BFS to find the shortest augmenting path; alternates between
     * layers of the bipartite graph (matched and unmatched vertices).
     * @return bool
     */
    private function bfs(): bool {
        $queue = new SplQueue();

        foreach ($this->pairU as $u => $v) {
            if ($v == self::NIL) {
                $this->dist[$u] = 0;
                $queue->enqueue($u);
            } else {
                $this->dist[$u] = self::INF;
            }
        }

        $this->dist[self::NIL] = self::INF;

        while (!$queue->isEmpty()) {
            $u = $queue->dequeue();
            if ($this->dist[$u] < $this->dist[self::NIL]) {
                foreach ($this->g->adj[$u] as $v) {
                    if ($this->dist[$this->pairV[$v]] == self::INF) {
                        $this->dist[$this->pairV[$v]] = $this->dist[$u] + 1;
                        $queue->enqueue($this->pairV[$v]);
                    }
                }
            }
        }

        return $this->dist[self::NIL] != self::INF;
    }

    /**
     * Modified DFS to find an augmenting path.
     * @param int $u
     * @return bool
     */
    private function dfs(int $u): bool {
        if ($u == self::NIL) {
            return true;
        }

        foreach ($this->g->adj[$u] as $v) {
            if ($this->dist[$this->pairV[$v]] == $this->dist[$u] + 1 &&
                $this->dfs($this->pairV[$v])) {
                $this->pairU[$u] = $v;
                $this->pairV[$v] = $u;

                return true;
            }
        }

        $this->dist[$u] = self::INF;
        return false;
    }

    /**
     * Finds the cardinality of the maximum matching in the bipartite graph.
     * @return int
     */
    public function maxMatching(): int {
        foreach ($this->g->a as $u) {
            $this->pairU[$u] = self::NIL;
            $this->dist[$u] = 0;
        }

        foreach ($this->g->b as $v) {
            $this->pairV[$v] = self::NIL;
        }

        $matching = 0;
        while ($this->bfs()) {
            foreach ($this->pairU as $u => $v) {
                if ($v == self::NIL && $this->dfs($u)) {
                    $matching++;
                }
            }
        }

        return $matching;
    }
}

