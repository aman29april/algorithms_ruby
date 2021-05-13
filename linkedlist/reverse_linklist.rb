require_relative './linklist'

def reverse_recursive(current)
  # If head is empty or has reached the list end
  return current if current.nil? || current.next.nil?

  rest = reverse_recursive(current.next)
  current.next.next = current
  current.next = nil
  rest
end

ll = LinkList.new
1.upto(5).each { |i| ll.add(i) }
ll.head = reverse_recursive(ll.head)
ll.print
