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
# def right_view(root, current_level = 1, max_level_so_far = [0], output = [])
#   return output if root.nil?

# if current_level > max_level_so_far[0]
#     output << root.val
#     max_level_so_far[0] = current_level
#   end

#   right_view(root.right, current_level + 1, max_level_so_far, output)
#   right_view(root.left, current_level + 1, max_level_so_far, output)

#   output
# end

# We are using array for max_level_so_far, so that it acts like pass by reference
def right_view(root, current_level = 0, output = [])
  return output if root.nil?

  output[current_level] = root.val
  right_view(root.left, current_level + 1, output)
  right_view(root.right, current_level + 1, output)

  output
end

def right_view_bfs(root)
  return [] if root.nil?

  queue = [root]
  output = []
  while queue.any?
    current = nil
    size = queue.size
    1.upto(size) do
      current = queue.shift
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
    end
    output << current.val
  end
  output
end

root = generate_tree

puts right_view(root).to_s
puts right_view_bfs(root).to_s
