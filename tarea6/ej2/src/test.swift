
let nodes: [Node<Int>] = (1...11).map { Node(value: $0) }
let tree = nodes[0]
tree.add(children: Array(nodes[1...3]))
nodes[1].add(children: Array(nodes[4...5]))
nodes[2].add(child: nodes[6])
nodes[5].add(child: nodes[7])
nodes[6].add(child: nodes[8])
nodes[7].add(children: Array(nodes[9...10]))

tree.printPreorder()

