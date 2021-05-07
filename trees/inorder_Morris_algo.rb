# Morris Inorder Tree Traversal

require './tree_node'
require './tree_generator'

def morris_traversal(node)
  return [] if node.nil?

  output = []
  current = node
  until current.nil?
    if current.left.nil?
      output << current.val
      current = current.right
    else
      predecessor = find_predecessor(current)
      if predecessor.right.nil?
        predecessor.right = current
        current = current.left
      else
        output << current.val
        predecessor.right = nil
        current = current.right
      end
    end
  end
  output
end

# rightmost child in left subtree
def find_predecessor(node)
  current = node.left
  current = current.right while current.right && current.right != node
  current
end

root = generate_tree

puts morris_traversal(root).to_s
