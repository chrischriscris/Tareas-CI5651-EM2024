// ========== TREE ==========
class Node<T>: CustomStringConvertible {
    var value: T
    var size: Int = 1
    var depth: Int = 0
    var children: [Node<T>] = []

    init(value: T) {
        self.value = value
    }

    var description: String {
        return "\(value)"
    }

    func add(child: Node<T>) {
        children.append(child)
    }

    func printTree() {
        print(self.value)
        for child in children {
            child.printTree()
        }
    }
}

var nodesByPreorder = [
    [1],
    [2, 3, 4],
    [5, 6],
    [],
    [8],
    [10, 11],
    [],
    [],
    [7],
    [9],
    [],
    []
]

func buildTree(_ nodesByPreorder: [[Int]]) -> Node<Int> {
    var stack: [Node<Int>] = []
    if nodesByPreorder.count == 0 {
        return Node(value: 0)
    }
}

let tree = buildTree(nodesByPreorder)
tree.printTree()

