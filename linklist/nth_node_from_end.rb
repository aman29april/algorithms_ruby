# Given the head of a linked list, remove the nth node from the end of the list and return its head.

# Input: head = [1,2,3,4,5], n = 2
# Output: [1,2,3,5]
# Example 2:

# Input: head = [1], n = 1
# Output: []
# Example 3:

# Input: head = [1,2], n = 1
# Output: [1]

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return nil if head.nil? || head.next.nil?

  len = length(head)
  delete_node_at_index(head, len - n)
end

def length(head)
  return 0 if head.nil?

  len = 0
  while head
    len += 1
    head = head.next
  end
  len
end

def delete_node_at_index(head, index)
  return nil if head.nil?
  return head = head.next if index.zero?

  current = head
  count = 0
  while current
    if count == index - 1
      current.next = current.next.next
      return head
    end
    count += 1
    current = current.next
  end

  head
end
