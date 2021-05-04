require './tree_node'
require './height'

root = TreeNode.new(3)
root.left = TreeNode.new(9)
right = TreeNode.new(20)
right.left = TreeNode.new(15)
right.right = TreeNode.new(7)
root.right = right

# puts height_iterative(root)
