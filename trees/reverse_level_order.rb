require './tree_node'
require './height_of_tree'

# Method 1, using recursion

def printReverseLevel(node)
  return [] if node.nil?

  height = height(node)
  output = []
  height.downto(0).each do |level|
    output << getLevel(node, level).flatten
  end
  output.compact
end

def getLevel(node, level)
  return [] if node.nil?
  return [node.val] if level.zero?

  [
    getLevel(node.left, level - 1) +
      getLevel(node.right, level - 1)
  ]
end

# Method 2, using queues

def print_reverse_level_using_q(node)
  return [] if node.nil?

  q = [node]
  stack = []
end

root = TreeNode.new(3)
root.left = TreeNode.new(9)
right = TreeNode.new(20)
right.left = TreeNode.new(15)
right.right = TreeNode.new(7)

root.right = right

puts printReverseLevel(root).to_s
