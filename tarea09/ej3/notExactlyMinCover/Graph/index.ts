import fs from "fs";

/**
 * Implementation of an undirected graph using adjacency list.
 */
export default class Graph<T> {
  public adj: Map<T, Set<T>>;

  constructor() {
    this.adj = new Map();
  }

  addVertex(u: T) {
    if (!this.adj.has(u)) this.adj.set(u, new Set());
  }

  addEdge(u: T, v: T) {
    this.addVertex(u);
    this.addVertex(v);

    this.adj.get(u)?.add(v);
    this.adj.get(v)?.add(u);
  }

  getVertices(): IterableIterator<T> {
    return this.adj.keys();
  }

  getAdjacents(u: T): Set<T> | undefined {
    return this.adj.get(u);
  }

  /**
   * Deletes a vertex and all its adjacent edges
   */
  deleteVertex(u: T) {
    this.getAdjacents(u)?.forEach((v) => this.adj.get(v)?.delete(u));
    this.adj.delete(u);
  }

  /**
   * Import a graph from a file in the format:
   * u1 v1
   * u2 v2
   * ...
   * where u and v are vertices of the graph.
   */
  importFromFile(filename: string, f: (node: string) => T) {
    // Not the best but
    const data = fs.readFileSync(filename, "utf-8");
    const lines = data.trimEnd().split("\n");

    // Hope the gc will handle the old data
    this.adj = new Map();
    for (const line of lines) {
      const [u, v] = line.split(" ").map(f);
      this.addEdge(u, v);
    }
  }
}

/**
 * Calculates a 1-approximation of a Minimal Vertex Cover for the given graph
 */
export function approximateMinCover<T>(g: Graph<T>): T[] {
  const minCover = [];

  for (const u of g.getVertices()) {
    const adjacents = g.getAdjacents(u)?.keys();
    const v = adjacents?.next().value;
    if (!adjacents || !v) continue;

    minCover.push(u, v);
    g.deleteVertex(u);
    g.deleteVertex(v);
  }

  return minCover;
}
