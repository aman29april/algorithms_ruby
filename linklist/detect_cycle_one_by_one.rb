# Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

require_relative './linklist'

def detect_cycle(head)
  return nil if head.nil?

  slow = head
  fast = head.next
  while slow && fast && fast.next
    slow = slow.next
    fast = fast.next.next
    if slow == fast
      find_node(head, slow)
      break
    end
  end
end

def find_node(head, loop_node)
  ptr1 = head
  while true
    ptr2 = loop_node

    ptr2 = ptr2.next while ptr2.next != loop_node && ptr2.next != ptr1
    if ptr2.next == ptr1
      # ptr2 is last node of loop
      #  TO remove loop, we can just make ptr2.next = None
      puts ptr2.val
      return ptr2
    else
      ptr1 = ptr1.next
    end
  end
end

ll = LinkList.new([1, 2, 3, 4, 5, 6], 0)
# ll.print
puts detect_cycle(ll.head)
