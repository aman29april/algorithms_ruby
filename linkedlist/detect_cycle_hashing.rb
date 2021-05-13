# Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
# Input: head = [3,2,0,-4], pos = 1
# Output: tail connects to node index 1
# Explanation: There is a cycle in the linked list, where tail connects to the second node.

require_relative './linklist'

# using hashing
def detect_cycle_hasing(head)
  return false if head.nil?

  current = head
  visited = { current.object_id => 0 }
  index = 1
  while current.next
    puts visited
    return "tail connects to node index #{visited[current.next.object_id]}" if visited[current.next.object_id]

    visited[current.next.object_id] = index
    current = current.next
    index += 1
  end

  'no cycle'
end

# LeetCode submission
def detectCycle(head)
  return nil if head.nil?

  current = head
  visited = { current.object_id => 0 }
  index = 1
  while current.next
    return current.next if visited[current.next.object_id]

    visited[current.next.object_id] = index
    current = current.next
    index += 1
  end

  nil
end

ll = LinkList.new([1, 2, 3, 4, 5, 6], 5)
# ll.print
puts detect_cycle_hasing(ll.head)
