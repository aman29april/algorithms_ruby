class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def level_order_bfs(root)
  return [] if root.nil?

  visited = {}
  queue = []
  output = []
  separator = '$'
  visited[root.val] = true
  # output << [root.val]
  queue << root
  queue << separator
  output << [root.val]
  level = []
  while queue.any?
    current = queue.shift
    if current == separator
      output << level if level.any?
      queue << separator if queue.any?
      level = []
      next
    end
    unless current.left.nil?
      visited[current.left.val] = true
      queue << current.left
      level << current.left.val
    end

    next if current.right.nil?

    visited[current.right.val] = true
    queue << current.right
    level << current.right.val

  end
  output
end

def tree_height(node)
  return 0 if node.left.nil? && node.right.nil?

  lheight = tree_height(node.left)
  rheight = tree_height(node.right)

  [rheight, lheight].compact.max + 1
end

def printLevelOrder(node)
  return [] if node.nil?

  height = tree_height(node)
  output = []
  (0..height).each do |level|
    output << get_level(node, level).flatten.compact
  end
  output
end

def get_level(node, level)
  return [] if node.nil?
  return [node.val] if level.zero?

  [get_level(node.left, level - 1) +
    get_level(node.right, level - 1)]
end

root = TreeNode.new(3)
root.left = TreeNode.new(9)
right = TreeNode.new(20)
right.left = TreeNode.new(15)
right.right = TreeNode.new(7)

root.right = right

# puts level_order_bfs(root).to_s
puts printLevelOrder(root).to_s
