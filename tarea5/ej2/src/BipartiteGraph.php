<?php
/**
 * Represents a bipartite graph as an adjacency list.
 * Stores the partition sets as well.
 */
class BipartiteGraph {
    public $a;
    public $b;
    public $adj;

    /**
     * Initializes the bipartite graph with the given sets of vertices.
     * It is assumed that every edge to be added is either from a to b or from
     * b to a.
     * @param array $a
     * @param array $b
     */
    public function __construct(array $a, array $b) {
        $this->a = $a;
        $this->b = $b;

        // maps every vertex in A to an empty array
        $this->adj = [];
        foreach ($a as $u) {
            $this->adj[$u] = [];
        }
    }

    /**
     * Adds an edge from u to v in the graph.
     * @param int $u
     * @param int $v
     */
    public function addEdge(int $u, int $v): void {
        $this->adj[$u][] = $v;
    }
}
