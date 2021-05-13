# Given a non-empty, singly linked list with head node head, return a middle node of linked list.
# If there are two middle nodes, return the second middle node.

def middle_node(head)
  return if head.nil?

  fast = head
  slow = head
  while fast && fast.next
    fast = fast.next.next
    slow = slow.next
  end
  slow
end
