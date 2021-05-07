require_relative '../trees/tree_node'

class BST
  attr_reader :root

  def initialize(values = [])
    values.each { |value| insert(value) } if values.any?
  end

  def insert(value)
    insert_helper(value)
  end

  def print
    puts inorder(@root).to_s
  end

  def insert_helper(value, node = @root)
    if node.nil?
      node = TreeNode.new(value)
      @root = node if @root.nil?
      return node
    end
    if value < node.val
      node.left.nil? ? node.left = TreeNode.new(value) : insert_helper(value, node.left)
    elsif value > node.val
      node.right.nil? ? node.right = TreeNode.new(value) : insert_helper(value, node.right)
    end
  end

  def inorder(node, output = [])
    return [] if node.nil?

    inorder(node.left, output)
    output << node.val
    inorder(node.right, output)
    output
  end
end

bst = BST.new([4, 33, 4, 5, 6, 42, 7])
bst.print

puts bst.root.to_s
