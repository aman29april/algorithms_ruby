def height(node)
  return 0 if node.nil? || (node.left.nil? && node.right.nil?)

  left = height(node.left)
  right = height(node.right)
  1 + [left, right].max
end

def height_iterative(node)
  return 0 if node.nil? || (node.left.nil? && node.right.nil?)

  queue = [node]
  height = 0
  while queue.any?
    height += 1
    nodes_in_current_level = queue.size
    1.upto(nodes_in_current_level).each do
      current_node = queue.shift
      queue.push current_node.left unless current_node.left.nil?
      queue.push current_node.right unless current_node.right.nil?
    end
  end
  height - 1
end
