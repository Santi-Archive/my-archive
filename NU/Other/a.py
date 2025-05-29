class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

class BinaryTree:
    def __init__(self, root_value):
        self.root = Node(root_value)
    
    def insert_left(self, current_node, value):
        if current_node.left is None:
            current_node.left = Node(value)
        else:
            new_node = Node(value)
            new_node.left = current_node.left
            current_node.left = new_node
    
    def insert_right(self, current_node, value):
        if current_node.right is None:
            current_node.right = Node(value)
        else:
            new_node = Node(value)
            new_node.right = current_node.right
            current_node.right = new_node

tree = BinaryTree(1)
tree.insert_left(tree.root, 2)
tree.insert_right(tree.root, 3)

tree.insert_left(tree.root.left, 4)
tree.insert_right(tree.root.left, 5)

def inorder_traversal(node):
    if node:
        inorder_traversal(node.left)
        print(node.value, end=' ')
        inorder_traversal(node.right)

inorder_traversal(tree.root)

def preorder_traversal(node):
    if node:
        print(node.value, end=' ')
        preorder_traversal(node.left)
        preorder_traversal(node.right)

def postorder_traversal(node):
    if node:
        postorder_traversal(node.left)
        postorder_traversal(node.right)
        print(node.value, end=' ')


class BinarySearchTree:
    def __init__(self):
        self.root = None

    def insert(self, value):
        self.root = self._insert_recursive(self.root, value)

    def _insert_recursive(self, node, value):
        if node is None:
            return Node(value)
        if value < node.value:
            node.left = self._insert_recursive(node.left, value)
        elif value > node.value:
            node.right = self._insert_recursive(node.right, value)
        return node

bst = BinarySearchTree()
values = [8, 3, 10, 1, 6, 14, 4, 7, 13]

for val in values:
    bst.insert(val)

# Inorder should print: 1 3 4 6 7 8 10 13 14
inorder_traversal(bst.root)


###############

class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

class BinaryTree:
    def __init__(self, root_value):
        self.root = Node(root_value)

    def insert(self, value):
        queue = [self.root]
        while queue:
            current = queue.pop(0)
            if current.left is None:
                current.left = Node(value)
                return
            else:
                queue.append(current.left)

            if current.right is None:
                current.right = Node(value)
                return
            else:
                queue.append(current.right)

    def inorder_traversal(self, node):
        if node:
            self.inorder_traversal(node.left)
            print(node.value, end=' ')
            self.inorder_traversal(node.right)

tree = BinaryTree(1)
tree.insert(2)
tree.insert(3)
tree.insert(4)
tree.insert(5)

tree.inorder_traversal(tree.root)
# Output: 4 2 5 1 3


def preorder_traversal(self, node):
    if node:
        print(node.value, end=' ')
        self.preorder_traversal(node.left)
        self.preorder_traversal(node.right)

def postorder_traversal(self, node):
    if node:
        self.postorder_traversal(node.left)
        self.postorder_traversal(node.right)
        print(node.value, end=' ')


############# user input

class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

class BinaryTree:
    def __init__(self, root_value):
        self.root = Node(root_value)

    def insert(self, value):
        queue = [self.root]
        while queue:
            current = queue.pop(0)

            if current.left is None:
                current.left = Node(value)
                return
            else:
                queue.append(current.left)

            if current.right is None:
                current.right = Node(value)
                return
            else:
                queue.append(current.right)

    def inorder_traversal(self, node):
        if node:
            self.inorder_traversal(node.left)
            print(node.value, end=' ')
            self.inorder_traversal(node.right)

    def preorder_traversal(self, node):
        if node:
            print(node.value, end=' ')
            self.preorder_traversal(node.left)
            self.preorder_traversal(node.right)

    def postorder_traversal(self, node):
        if node:
            self.postorder_traversal(node.left)
            self.postorder_traversal(node.right)
            print(node.value, end=' ')

# Get input from user
values = input("Enter tree values separated by spaces: ").split()

# Initialize tree with the first value
tree = BinaryTree(int(values[0]))

# Insert the rest
for val in values[1:]:
    tree.insert(int(val))

# Display traversals
print("\nInorder Traversal: ", end='')
tree.inorder_traversal(tree.root)

print("\nPreorder Traversal: ", end='')
tree.preorder_traversal(tree.root)

print("\nPostorder Traversal: ", end='')
tree.postorder_traversal(tree.root)

