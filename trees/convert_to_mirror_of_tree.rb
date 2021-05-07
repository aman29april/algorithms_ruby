# Given a binary tree, the task is to create a new binary tree which is a mirror image of the given binary tree.
# https://www.geeksforgeeks.org/create-a-mirror-tree-from-the-given-binary-tree/
# Examples:

# Input:
#         5
#        / \
#       3   6
#      / \
#     2   4
# Output:
# Inorder of original tree: 2 3 4 5 6
# Inorder of mirror tree: 6 5 4 3 2
# Mirror tree will be:
#   5
#  / \
# 6   3
#    / \
#   4   2

# Input:
#         2
#        / \
#       1   8
#      /     \
#     12      9
# Output:
# Inorder of original tree: 12 1 2 8 9
# Inorder of mirror tree: 9 8 2 1 12

require './tree_node'
require './tree_generator'

def print_inorder(node)
  @inorder_result = []
  inorder(node)
  puts @inorder_result.to_s
end

def inorder(node)
  return if node.nil?

  inorder(node.left)
  @inorder_result << node.val
  inorder(node.right)
end

# Method 1 using post order traversal
def convert_to_mirror(node)
  return if node.nil?

  # We will do a post-order traversal of the binary tree.
  convert_to_mirror(node.left) unless node.left.nil?
  convert_to_mirror(node.right) unless node.right.nil?

  # Let's swap the left and right nodes at current level.
  temp = node.left
  node.left = node.right
  node.right = temp
end

# Method 2 using preorder traversal
def convert_to_mirror_preorder(node)
  return if node.nil?

  # swap the left and right nodes at current level.
  temp = node.left
  node.left = node.right
  node.right = temp

  # pre-order traversal
  convert_to_mirror(node.left) unless node.left.nil?
  convert_to_mirror(node.right) unless node.right.nil?
end

# Method 3, Iterative
# Using Level order traversal/BFS

def convert_to_mirror_iterative(node)
  return if node.nil?

  queue = [node]
  while queue.any?
    current = queue.shift
    queue << current.left unless current.left.nil?
    queue << current.right unless current.right.nil?
    current.left = current.left
    current.right = current.right
  end
end

root = generate_tree
print_inorder(root)
convert_to_mirror_iterative(root)

print_inorder(root)
