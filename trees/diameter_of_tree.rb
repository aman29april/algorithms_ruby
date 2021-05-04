require './tree_node'

# def diameter_rec1(node)
# 	return 0 if node.nil? || (node.left.nil? && node.right.nil?)
# 	lh = height(node.left)
# 	rh = height(node.right)
# 	ld = diameter_rec1(node.left)
# 	rd = diameter_rec1(node.right)
# 	puts [node.val, ld,rd, (2 + lh + rh)].to_s
# 	[ld,rd, (2 + lh + rh)].max
# end

def height(node)
  return 0 if node.nil?

  lh = height(node.left)
  rh = height(node.right)
  @ans = [@ans, lh + rh].max
  1 + [lh, rh].max
end

def diameter_of_binary_tree(root)
  @ans = 0
  height(root)
  @ans
end

root = TreeNode.new(3)
root.left = TreeNode.new(9)
right = TreeNode.new(20)
right.left = TreeNode.new(15)
right.right = TreeNode.new(7)
root.right = right

puts diameter_of_binary_tree(root)
