# Morris Inorder Tree Traversal

require './tree_node'
require './tree_generator'

def preorder_recursive(node, output = [])
  return [] if node.nil?

  output << node.val
  preorder_recursive(node.left, output)
  preorder_recursive(node.right, output)
  output
end

def preorder_iterative(node, output = [])
  return [] if node.nil?

  stack = [node]
  while current = stack.pop
    output << current.val
    stack.push current.right unless current.right.nil?
    stack.push current.left unless current.left.nil?
  end
  output
end
root = generate_tree

puts preorder_recursive(root).to_s
puts preorder_iterative(root).to_s
