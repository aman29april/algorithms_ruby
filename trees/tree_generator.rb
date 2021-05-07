require './tree_node'

# Will create below tree
#       3
#       /\
#      9  20
#          /\
#         15 7

def generate_tree
  root =	TreeNode.new(3)
  root.left =	TreeNode.new(9)
  right = 		TreeNode.new(20)
  right.left = 	TreeNode.new(15)
  right.right = TreeNode.new(7)
  root.right = 	right
  root
end
