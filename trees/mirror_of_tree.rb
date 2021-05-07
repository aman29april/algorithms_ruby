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

def mirror_of_tree(node)
  return if node.nil?

  new_node = TreeNode.new(node.val)
  new_node.left = mirror_of_tree(node.right)
  new_node.right = mirror_of_tree(node.left)
  new_node
end

root = generate_tree
print_inorder(root)
mirror_tree = mirror_of_tree(root)

print_inorder(mirror_tree)
