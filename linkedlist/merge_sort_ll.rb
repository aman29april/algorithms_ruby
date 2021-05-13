require_relative './linklist'

def merge_sort(head)
  return head if head.nil? || head.next.nil?

  middle = get_middle_node(head)
  next_to_middle = middle.next
  middle.next = nil
  left = merge_sort(head)
  right = merge_sort(next_to_middle)
  sorted_merge2(left, right)
end

def sorted_merge(head_a, head_b)
  return head_b if head_a.nil?
  return head_a if head_b.nil?

  if head_a.val <= head_b.val
    result = head_a
    result.next = sorted_merge(head_a.next, head_b)
  else
    result = head_b
    result.next = sorted_merge(head_b.next, head_a)
  end
  result
end

def sorted_merge2(head_a, head_b)
  return head_b if head_a.nil?
  return head_a if head_b.nil?

  # set head
  if head_a.val <= head_b.val
    head = head_a
    head_a = head_a.next
  else
    head = head_b
    head_b = head_b.next
  end

  # set all
  pointer = head
  while !head_a.nil? && !head_b.nil?
    if head_a.val <= head_b.val
      pointer.next = head_a
      head_a = head_a.next
    else
      pointer.next = head_b
      head_b = head_b.next
    end
    pointer = pointer.next
  end
  # set leftovers if any
  pointer.next = nil
  pointer.next = head_a unless head_a.nil?
  pointer.next = head_b unless head_b.nil?

  head
end

def print(head)
  output = []
  while head
    output << head.val
    head = head.next
  end
  puts output.to_s
  ''
end

def get_middle_node(head)
  return if head.nil?

  slow = head
  fast = head
  while fast.next && fast.next.next
    slow = slow.next
    fast = fast.next.next
  end
  slow
end

ll = LinkList.new([4, 2, 1, 3])
# puts get_middle_node(ll.head).val
ll.head = merge_sort(ll.head)
puts ll.print
