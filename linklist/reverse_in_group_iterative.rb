require_relative './linklist'

def reverse_in_groups(head, k)
  return if head.nil?

  reversed_ll = LinkList.new
  current = head
  prev = nil
  until current.nil?
    ll = LinkList.new
    count = 0
    head = current
    while count < k && current
      ll.head = insert_at_begining(ll.head, current.val)
      current = current.next
      if count.zero?
        tail = prev
        prev = ll.head
      end
      count += 1
    end
    reversed_ll.head = ll.head if reversed_ll.head.nil?

    if count < k
      tail.next = head
    elsif tail
      tail.next = ll.head
    end

  end
  # puts reversed_ll.head
  reversed_ll.head
end

def reverse_k_group(head, k)
  return if head.nil?

  reversed_ll = nil
  current = head
  prev = nil
  until current.nil?
    group_ll = nil
    count = 0
    head = current
    while count < k && current
      group_ll = insert_at_begining(group_ll, current.val)
      current = current.next

      # First element of the loop will be become tail of group ll
      if count.zero?
        tail = prev
        prev = group_ll
      end
      count += 1
    end

    reversed_ll = group_ll if reversed_ll.nil?

    # If there were no sufficient elements in the group
    # then append leftover orignal list
    if count < k
      tail.next = head
    elsif tail
      tail.next = group_ll
    end

  end
  reversed_ll
end

def insert_at_begining(head, val)
  node = Node.new(val)
  return node if head.nil?

  node.next = head
  node
end

def remove_first(head)
  return if head.nil?

  node = head
  head = node.next
  [node, head]
end

ll = LinkList.new
1.upto(11).each { |i| ll.add(i) }
ll.head = reverse_k_group(ll.head, 3)
ll.print
