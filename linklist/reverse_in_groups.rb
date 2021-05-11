require_relative './linklist'

def reverse_in_groups(head, k)
  return if head.nil?

  current = head
  prev = nil
  nxt = nil

  # if number of nodes is not a multiple of k
  # left-out nodes, in the end, should remain as it is.
  tmp = head
  1.upto(k) do |i|
    tmp = tmp.next
    if tmp.nil? && i < k
      puts i
      return head
    end
  end

  # Reverse first k nodes of the linked list
  1.upto(k) do
    nxt = current.next
    current.next = prev
    prev = current
    current = nxt
  end

  # next is now a pointer to (k+1)th node
  # recursively call for the list starting from current.
  # And make rest of the list as next of first node
  head.next = reverse_in_groups(nxt, k) unless nxt.nil?

  # prev is new head of the input list
  prev
end

ll = LinkList.new
1.upto(10).each { |i| ll.add(i) }
ll.head = reverse_in_groups(ll.head, 3)
ll.print
