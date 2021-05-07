#  Left view of a Binary Tree is a set of nodes visible when a tree is visited from the left side.
# Input :
#                  1
#                /   \
#               2     3
#              / \     \
#             4   5     6
# Output : 1 2 4

require './tree_node'
require './tree_generator'

# We are using array for max_level_so_far, so that it acts like pass by reference
def left_view(root, current_level = 1, max_level_so_far = [0], output = [])
  return output if root.nil?

  if current_level > max_level_so_far[0]
    output << root.val
    max_level_so_far[0] = current_level
  end

  left_view(root.left, current_level + 1, max_level_so_far, output)
  left_view(root.right, current_level + 1, max_level_so_far, output)
  output
end

def left_view_bfs(root)
  return [] if root.nil?

  queue = [root]
  output = []
  while queue.any?
    size = queue.size
    1.upto(size) do |i|
      node = queue.shift
      output << node.val if i == 1
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
  end
  output
end

root = generate_tree

puts left_view(root).to_s
puts left_view_bfs(root).to_s
