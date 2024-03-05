// ========== TREE ==========
class Node<T>: CustomStringConvertible {
    var value: T
    var count: Int = 1
    var depth: Int = 0
    var children: [Node<T>] = []

    init(value: T) {
        self.value = value
    }

    var description: String {
        return "Value: \(value), Depth: \(depth), Count: \(count)"
    }

    func add(child: Node<T>) {
        children.append(child)
    }

    func add(children: [Node<T>]) {
        self.children.append(contentsOf: children)
    }

    func printPreorder() {
        print(self)
        for child in children {
            child.printPreorder()
        }
    }
}

func preconditionTree<T>(_ tree: Node<T>) {
    dfs(node: tree, depth: 0)
}

/**
 * DFS to calculate the depth of each node and the number of nodes
 * in the subtree rooted at the current node, including itself.
 */
func dfs<T>(node: Node<T>, depth: Int) {
    node.count = 1
    node.depth = depth
    for child in node.children {
        dfs(node: child, depth: depth + 1)
        node.count += child.count
    }
}

func hld<T>(_ tree: Node<T>) {
    // Find the heavy child of each node
    var heavyChild: Node<T>? = nil
    for child in tree.children {
        if child.count >= tree.count / 2 {
            heavyChild = child
        }
    }

    if heavyChild == nil {
        return
    }

    print("Heavy child of [\(tree)] found: [\(heavyChild!)]")

    hld(heavyChild!)
}

func heavyLightDecomposition<T>(_ tree: Node<T>) {
    preconditionTree(tree)
    hld(tree)
}

// ========== MAIN ==========

let nodes: [Node<Int>] = (1...11).map { Node(value: $0) }
let tree = nodes[0]
tree.add(children: Array(nodes[1...3]))
nodes[1].add(children: Array(nodes[4...5]))
nodes[2].add(child: nodes[6])
nodes[5].add(child: nodes[7])
nodes[6].add(child: nodes[8])
nodes[7].add(children: Array(nodes[9...10]))

heavyLightDecomposition(tree)

// tree.printPreorder()

