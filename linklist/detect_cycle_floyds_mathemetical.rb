# Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

require_relative './linklist'

def detectCycle(head)
  slow = head
  fast = head
  while slow && fast && fast.next

    slow = slow.next
    fast = fast.next.next

    next unless slow == fast

    slow = head

    while slow != fast
      slow = slow.next
      fast = fast.next
    end

    return fast
  end
  nil
end

# ll = LinkList.new([1, 2, 3, 4, 5, 6], 2)
# puts detect_cycle(ll.head)
#
#
ll = LinkList.new([1, 2], 0)
puts detectCycle(ll.head)
