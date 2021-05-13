require_relative './linklist'

# Floyd's Tortoise and Hare Algorithm
def has_cycle?(head)
  return false if head.nil?

  slow = head
  fast = head
  while !slow.nil? && !fast.nil? && !fast.next.nil?
    slow = slow.next
    fast = fast.next.next
    return true if slow == fast
  end
  false
end

# using hashing
def has_cycle1?(head)
  return false if head.nil?

  visited = {}

  while head
    return true if visited[head.object_id]

    visited[head.object_id] = true
    head = head.next
  end

  false
end

ll = LinkList.new([1, 2, 3, 4, 5, 6], 3)
puts has_cycle1?(ll.head)
