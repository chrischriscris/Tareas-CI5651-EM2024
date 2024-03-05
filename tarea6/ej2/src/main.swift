// ========== GRAPH ==========

/**
 * Graph as an adjacency map of elements of type T
 */
class Graph<T: Hashable>: CustomStringConvertible {
    var adjacencyMap: [T: [T]] = [:]

    var description: String {
        var s = ""
        for (vertex, edges) in adjacencyMap {
            s += "\(vertex) -> \(edges)\n"
        }
        return s
    }

    func addEdge(from: T, to: T) {
        if adjacencyMap[from] == nil {
            adjacencyMap[from] = []
        }
        adjacencyMap[from]?.append(to)
    }

}

let edges = [
    [1, 2], [1, 3], [1, 4],
    [2, 5], [2, 6],
    [3, 7],
    [6, 8],
    [7, 9],
    [8, 10], [8, 11]
]

var graph = Graph<Int>()
for edge in edges {
    graph.addEdge(from: edge[0], to: edge[1])
}

// ========== LABELED GRAPH ==========

