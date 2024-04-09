import readline from "readline";
import fs from "fs";

/**
 * Implementation of an undirected graph using adjacency list.
 */
class Graph<T> {
  private adj: Map<T, T[]>;

  constructor() {
    this.adj = new Map();
  }

  addVertex(v: T) {
    if (!this.adj.has(v)) {
      this.adj.set(v, []);
    }
  }

  addEdge(u: T, v: T) {
    this.addVertex(u);
    this.addVertex(v);

    this.adj.get(u)?.push(v);
    this.adj.get(v)?.push(u);
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
    const lines = data.split("\n");
    lines.pop();

    // Hope the gc will handle the old data
    this.adj = new Map();
    for (const line of lines) {
      const [u, v] = line.split(" ").map(f);
      console.log("Adding edge", u, v);
      this.addEdge(u, v);
    }
  }
}

function main() {
  const graph = new Graph<number>();
  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 3);
  graph.addEdge(3, 3);

  console.log("Adjacency list of the graph:");
  console.log(graph);

  // Read file from command line argument
  const filename = process.argv[2];
  if (filename) {
    graph.importFromFile(filename, (node) => parseInt(node));
    console.log("Adjacency list of the graph from file:");
    console.log(graph);
  }
}

main();
