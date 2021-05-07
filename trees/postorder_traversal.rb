# Morris Inorder Tree Traversal

require './tree_node'
require './tree_generator'

def postorder_recursive(node, output = [])
  return [] if node.nil?

  postorder_recursive(node.left, output)
  postorder_recursive(node.right, output)
  output << node.val
  output
end

def postorder_iterative(node)
  return [] if node.nil?

  output = []
  stack = [node]
  output_stack = []
  while current = stack.pop
    output_stack.push current.val
    stack.push current.left unless current.left.nil?
    stack.push current.right unless current.right.nil?
  end

  # empty the stack to output
  output << output_stack.pop while output_stack.any?
  output
end
root = generate_tree

puts postorder_recursive(root).to_s
puts postorder_iterative(root).to_s
