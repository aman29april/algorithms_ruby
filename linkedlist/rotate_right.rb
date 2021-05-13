require_relative './linklist'

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
#

# using length
# def rotate_right(head, k)
#   return head if head.nil? || k.zero?

#   len = 1
#   current_node = head
#   while current_node.next
#     len += 1
#     current_node = current_node.next
#   end
#   #     current_node will be last node
#   last_node = current_node
#   k = k % len if k > len
#   return head if len == 1 || k == len || k.zero?

#   count = 0
#   node = head
#   while count < len - k - 1
#     count += 1
#     node = node.next
#   end
#   new_head = node.next
#   node.next = nil
#   last_node.next = head
#   head = new_head
# end

# # using two pointers
# def rotate_right(head, k)
#   return nil if head.nil?
#   return head if k.zero?

#   len = 1
#   current_node = head
#   while current_node.next
#     len += 1
#     current_node = current_node.next
#   end

#   k = k % len if k > len
#   return head if len == 1 || k == len || k == 0

#   ptr1 = head
#   ptr2 = head
#   count = 0
#   while ptr1
#     ptr1 = ptr1.next
#     ptr2 = ptr2.next if count > k
#     count += 1
#   end
#   return head if count == k

#   new_head = ptr2.next
#   ptr2.next = nil
#   tail = current_node
#   tail.next = head
#   head = new_head
# end

def rotate_right(head, k)
  return head if head.nil? || k.zero?

  len = 1
  current_node = head
  while current_node.next
    len += 1
    current_node = current_node.next
  end

  k = k % len if k > len
  return head if len == 1 || k == len || k.zero?

  prev = nil
  current_node.next = head
  current_node = current_node.next
  (len - k - 1).times do
    prev = current_node
    current_node = current_node.next
  end

  prev.next = nil
  current_node
end

def length(head)
  return 0 if head.nil?

  count = 0
  while head
    count += 1
    head = head.next
  end
  count
end

ll = LinkList.new([1, 2, 3, 4, 5, 6])
ll.head = rotate_right(ll.head, 1)
puts ll.print

ll = LinkList.new([1])
ll.head = rotate_right(ll.head, 2)
puts ll.print
