import Graph, { approximateMinCover } from "./Graph";

function main() {
  const filename = process.argv[2];
  if (!filename) {
    console.log("Error: Must provide a filename as a command line argument");
    process.exit(1);
  }

  const graph = new Graph<number>();
  try {
    graph.importFromFile(filename, (node) => parseInt(node));
  } catch {
    console.log("Error: Invalid file");
    process.exit(1);
  }

  console.log(`Vertex cover found: ${approximateMinCover(graph).join(" ")}`);
}

main();
