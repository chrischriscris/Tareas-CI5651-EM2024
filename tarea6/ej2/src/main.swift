/**
 * Node class for a tree.
 * It has a value, a count of nodes in the subtree rooted at the current node,
 * a depth, a list of children, a parent, a chain number and a chain index.
 *
 * The chain number is the index of the chain in the heavy-light decomposition.
 * The chain index is the index of the node in the chain.
 */
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

/**
 * Heavy-Light Decomposition implementation.
 * Takes a tree and a list, and fills the list with the heavy paths of the tree.
 */
func heavyLightDecomposition<T>(_ tree: Node<T>) -> [[T]] {
    dfs(node: tree, depth: 0);

    var chains: [[T]] = [];
    hld(tree, &chains, true);

    return chains;
}

// ========== TREE ==========
/**
 * Segment tree for a list of booleans.
 * Supports queries for existence and all in a given range.
 */
class BoolSegmentTree: CustomStringConvertible {
    var left: BoolSegmentTree?;
    var leftBound: Int = 0;

    var right: BoolSegmentTree?;
    var rightBound: Int = 0;

    var value: [String: Bool];

    init(_ arr: [Bool], _ _leftBound: Int, _ _rightBound: Int) {
        leftBound = _leftBound;
        rightBound = _rightBound;
        let n = arr.count;

        if n == 0 {
            value = ["exists": false, "all": true];
            return;
        }

        if n == 1 {
            value = ["exists": arr.first!, "all": arr.first!];
            return;
        }

        let mid = n / 2;
        left = BoolSegmentTree(
            Array(arr[0..<mid]),
            leftBound,
            leftBound + mid - 1
        );
        right = BoolSegmentTree(
            Array(arr[mid..<n]),
            leftBound + mid,
            rightBound
        );

        value = [
            "exists": left!.value["exists"]! || right!.value["exists"]!,
            "all": left!.value["all"]! && right!.value["all"]!
        ];
    }

    var description: String {
        var str = "Value: \(value)";
        if left != nil {
            str += "\nLeft: \(left!.description)";
        }

        if right != nil {
            str += "\nRight: \(right!.description)";
        }

        return str;
    }

    func query(_ i: Int, _ j: Int) -> [String: Bool] {
        if i > rightBound || j < leftBound {
            return ["exists": false, "all": true];
        }

        if i <= leftBound && rightBound <= j {
            return value;
        }

        let leftQuery = left!.query(i, j);
        let rightQuery = right!.query(i, j);

        return [
            "exists": leftQuery["exists"]! || rightQuery["exists"]!,
            "all": leftQuery["all"]! && rightQuery["all"]!
        ];
    }

    func exists(_ i: Int, _ j: Int) -> Bool {
        return query(i, j)["exists"]!;
    }

    func all(_ i: Int, _ j: Int) -> Bool {
        return query(i, j)["all"]!;
    }
}

/**
 * Builds a segment tree for a list of elements, given a predicate.
 * The predicate is used to determine the value of the edges in the tree.
 */
func buildSegmentTree<T>(
    _ chain: [T],
    _ predicate: (T, T) -> Bool
) -> BoolSegmentTree {
    var i = 0;
    var edges: [Bool] = [];
    while (i < chain.count - 1) {
        edges.append(predicate(chain[i], chain[i + 1]));
        i += 1;
    }

    return BoolSegmentTree(edges, 0, edges.count - 1);
}

// ========== MAIN ==========

func main() {
    let nodes: [Node<Int>] = (1...11).map { Node(value: $0) };

    let tree = nodes[0];
    tree.add(children: Array(nodes[1...3]));
    nodes[1].add(children: Array(nodes[4...5]));
    nodes[2].add(child: nodes[6]);
    nodes[5].add(child: nodes[7]);
    nodes[6].add(child: nodes[8]);
    nodes[7].add(children: Array(nodes[9...10]));

    func predicate(parent a: Int, child b: Int) -> Bool {
        return [1, 2, 9].contains(a);
    }

    var segmentTrees: [BoolSegmentTree] = [];
    for chain in heavyLightDecomposition(tree) {
        segmentTrees.append(buildSegmentTree(chain, predicate));
    }
}

main();
