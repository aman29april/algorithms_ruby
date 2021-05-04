require "./tree_node"


def dfs_iterative(node)
	return [] if node.nil?
	stack = [node]
	queue = []
	while node = stack.pop
		queue << node.val
		left,right = node.left, node.right
		stack << left if (!left.nil? && !queue.include?(left))
		stack << right if (!right.nil? && !queue.include?(right))
	end
	return queue
end

root = TreeNode.new(3)
root.left = TreeNode.new(9)
right = TreeNode.new(20)
right.left = TreeNode.new(15)
right.right = TreeNode.new(7)
root.right = right

puts dfs_iterative(root).to_s