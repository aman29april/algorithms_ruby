require './tree_node'

def inorder_recursive(node)
  return if node.nil?

  inorder_recursive(node.left)
  puts node.val
  inorder_recursive(node.right)
end

def inorder_iterative(node)
  return [] if node.nil?

  current = node
  stack = []
  result = []

  while true
    if !current.nil?
      stack.append current
      current = current.left
    else
      break unless stack.any?

      current = stack.pop
      result.push current.val
      current = current.right
    end
  end
  result
end

root = TreeNode.new(3)
root.left = TreeNode.new(9)
right = TreeNode.new(20)
right.left = TreeNode.new(15)
right.right = TreeNode.new(7)
root.right = right

# puts inorder_recursive(root)
puts inorder_iterative(root).to_s
