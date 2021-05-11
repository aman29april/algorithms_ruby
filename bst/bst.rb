require_relative '../trees/tree_node'

class BST
  attr_reader :root

  def initialize(values = [])
    values.each { |value| insert(value) } if values.any?
  end

  def print
    puts inorder(@root).to_s
  end

  def insert(value, node = @root)
    if node.nil?
      node = TreeNode.new(value)
      @root = node if @root.nil?
      return node
    end
    if value < node.val
      node.left = insert(value, node.left)
    elsif value > node.val
      node.right = insert(value, node.right)
    end
    node
  end

  def search(val, node = @root)
    return false if node.nil?

    case val <=> node.val
    when 1 then search(val, node.right)
    when -1 then search(val, node.left)
    when 0 then true
    end
  end

  def inorder(node, output = [])
    return [] if node.nil?

    inorder(node.left, output)
    output << node.val
    inorder(node.right, output)
    output
  end

  def min(node = @root)
    return nil if node.nil?

    current = node
    while current
      min = current.val
      current = current.left
    end
    min
  end

  def max(node = @root)
    return nil if node.nil?

    current = node
    while current
      max = current.val
      current = current.right
    end
    max
  end

  def delete(val, node = @root)
    return if node.nil?

    if val < node.val
      node.left = delete(val, node.left)
    elsif val > node.val
      node.right = delete(val, node.right)
    elsif node.left.nil? && node.right.nil?
      # leaf node
      return nil
    elsif node.left.nil? # only left child
      return node.right
    elsif node.right.nil? # only right child
      return node.left
    else
      # both left and right subtree
      replacement = min(node.right)
      node.val = replacement
      node.right = delete(replacement, node.right)
      return node

    end
    node
  end
end

bst = BST.new([10, 2, 33, 4, 5, 3, 42])
bst.print

# puts bst.search(4)
# puts bst.min

# puts bst.max

puts bst.delete(4)
puts bst.print
