class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

    def __str__(self):
        buffer = [f"Node({self.value})"]
        if self.left is not None:
            buffer.append(f"left={self.left}")
        if self.right is not None:
            buffer.append(f"right={self.right}")

        return ", ".join(buffer)

    def preorder(self):
        if self is not None:
            print(self.value, end=" ")
            if self.left is not None:
                self.left.preorder()
            if self.right is not None:
                self.right.preorder()

    def inorder(self):
        if self is not None:
            if self.left is not None:
                self.left.inorder()
            print(self.value, end=" ")
            if self.right is not None:
                self.right.inorder()

    def postorder(self):
        if self is not None:
            if self.left is not None:
                self.left.postorder()
            if self.right is not None:
                self.right.postorder()
            print(self.value, end=" ")

    def euler_tour(self):
        if self is not None:
            print(self.value, end=" ")
            if self.left is not None:
                self.left.euler_tour()
            print(self.value, end=" ")
            if self.right is not None:
                self.right.euler_tour()
            print(self.value, end=" ")


def insert(root, value):
    if root is None:
        return Node(value)
    if value < root.value:
        root.left = insert(root.left, value)
    else:
        root.right = insert(root.right, value)
    return root


root = Node("c")
for c in "hristopegmz":
    root = insert(root, c)

print(root)

print("Preorder")
root.preorder()

print("\nInorder")
root.inorder()

print("\nPostorder")
root.postorder()

print("\nEuler Tour")
root.euler_tour()
