# Create Node class
class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None


# Create BST class
class BST:
    def __init__(self):
        self.root = None

    # Insert node
    def insert(self, data):
        new_node = Node(data)

        if self.root is None:
            self.root = new_node
            return

        temp = self.root

        while True:
            if data < temp.data:
                if temp.left is None:
                    temp.left = new_node
                    break
                temp = temp.left
            else:
                if temp.right is None:
                    temp.right = new_node
                    break
                temp = temp.right

    # Level Order Traversal
    def level_order(self):
        if self.root is None:
            print("Tree is Empty")
            return

        queue = [self.root]

        while len(queue) > 0:
            temp = queue.pop(0)
            print(temp.data, end=" ")

            if temp.left is not None:
                queue.append(temp.left)

            if temp.right is not None:
                queue.append(temp.right)

    # Find Height
    def height(self, node):
        if node is None:
            return 0

        left_height = self.height(node.left)
        right_height = self.height(node.right)

        return 1 + max(left_height, right_height)

    # Print Leaf Nodes
    def leaf_nodes(self, node):
        if node is not None:
            if node.left is None and node.right is None:
                print(node.data, end=" ")

            self.leaf_nodes(node.left)
            self.leaf_nodes(node.right)

    # Copy BST
    def copy_tree(self, node):
        if node is None:
            return None

        new_node = Node(node.data)
        new_node.left = self.copy_tree(node.left)
        new_node.right = self.copy_tree(node.right)

        return new_node


# Main Program
bst = BST()

while True:
    print("\n--- Employee Database ---")
    print("1. Insert Employee ID")
    print("2. Display Original BST Level-wise")
    print("3. Create and Display New BST")
    print("4. Find Height")
    print("5. Display Leaf Nodes")
    print("6. Exit")

    choice = int(input("Enter your choice: "))

    if choice == 1:
        emp_id = int(input("Enter Employee ID: "))
        bst.insert(emp_id)
        print("Employee ID inserted.")

    elif choice == 2:
        print("Original BST Level-wise:")
        bst.level_order()

    elif choice == 3:
        new_bst = BST()
        new_bst.root = bst.copy_tree(bst.root)

        print("New BST Level-wise:")
        new_bst.level_order()

    elif choice == 4:
        print("Height of BST:", bst.height(bst.root))

    elif choice == 5:
        print("Leaf Nodes:")
        bst.leaf_nodes(bst.root)

    elif choice == 6:
        print("Program Ended")
        break

    else:
        print("Invalid Choice")

    print()
