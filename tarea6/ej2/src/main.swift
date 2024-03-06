// ========== TREE ==========
class Node<T>: CustomStringConvertible {
    var value: T;
    var count: Int = 1;
    var depth: Int = 0;
    var children: [Node<T>] = [];
    var parent: Node<T>?;
    var chainNumber: Int = -1;
    var chainIndex: Int = -1;

    init(value: T) {
        self.value = value;
    }

    var description: String {
        return "Value: \(value), "
            + "Depth: \(depth), "
            + "Count: \(count), "
            + "ChainNumber: \(chainNumber), "
            + "ChainIndex: \(chainIndex)";
    }

    func add(child: Node<T>) {
        children.append(child);
        child.parent = self;
    }

    func add(children: [Node<T>]) {
        for child in children {
            add(child: child);
        }
    }

    func printPreorder() {
        print(self);
        for child in children {
            child.printPreorder();
        }
    }
}

/**
 * DFS to calculate the depth of each node and the number of nodes
 * in the subtree rooted at the current node, including itself.
 */
func dfs<T>(node: Node<T>, depth: Int) {
    node.count = 1;
    node.depth = depth;
    for child in node.children {
        dfs(node: child, depth: depth + 1);
        node.count += child.count;
    }
}

/**
 * Heavy-Light Decomposition implementation.
 * Takes a tree and a list, and fills the list with the heavy paths of the tree.
 *
 * First call should be with isFirst = true and chainNumber = 0.
 */
func hld<T>(_ tree: Node<T>, _ chains: inout [[T]], _ isFirst: Bool) {
    if isFirst {
        chains.append([tree.value]);
    } else {
        chains[chains.count - 1].append(tree.value);
    }

    tree.chainNumber = chains.count - 1;
    tree.chainIndex = chains[chains.count - 1].count - 1;

    var heavyChild: Node<T>?
    for child in tree.children {
        if child.count >= tree.count / 2 {
            heavyChild = child;
        }
    }

    if heavyChild == nil {
        return;
    }

    hld(heavyChild!, &chains, false);

    for child in tree.children {
        if child !== heavyChild {
            hld(child, &chains, true);
        }
    }
}

func heavyLightDecomposition<T>(_ tree: Node<T>) {
    dfs(node: tree, depth: 0);

    var chains: [[T]] = [];
    hld(tree, &chains, true);

    print(chains);
}

// ========== MAIN ==========

let nodes: [Node<Int>] = (1...11).map { Node(value: $0) };

let tree = nodes[0];
tree.add(children: Array(nodes[1...3]));
nodes[1].add(children: Array(nodes[4...5]));
nodes[2].add(child: nodes[6]);
nodes[5].add(child: nodes[7]);
nodes[6].add(child: nodes[8]);
nodes[7].add(children: Array(nodes[9...10]));

heavyLightDecomposition(tree)

