require_relative './node'
class LinkList
  attr_accessor :head

  # pos is used to denote the index of the node that tail's next pointer is connected to
  # if pos is -1, tail will point to nil
  def initialize(values = [], pos = -1)
    @head = nil
    if values.any?
      # expected 'pos' to have value from -1 to size of values only
      pos_limit = values.length - 1
      raise "expected 'pos' to have value from -1 to #{pos_limit} only" if (pos > pos_limit) || pos < -1

      values.each_with_index { |val, i| add_with_pos(val, pos, i == pos_limit) }
    end
  end

  def add(val, head = @head)
    node = Node.new(val)
    return @head = node if @head.nil?

    head = head.next while head.next
    head.next = node
  end

  def print(head = @head)
    output = []
    while head
      output << head.val
      head = head.next
    end
    puts output.to_s
  end

  def reverse(head = @head)
    current = head
    prev = nil
    while current
      temp = current.next
      current.next = prev
      prev = current
      current = temp
    end
    @head = prev
  end

  private

  def add_with_pos(val, pos, is_tail = false)
    head = @head
    node = Node.new(val)
    if head.nil?
      node.next = node if pos.zero? && is_tail
      return @head = node
    end
    head = head.next while head.next
    head.next = node
    node.next = node_at_index(@head, pos) if is_tail
  end

  def node_at_index(head = @head, index)
    return nil if head.nil? || index < 0

    count = 0
    while head
      return head if index == count

      count += 1
      head = head.next
    end
    nil
  end
end

# ll = LinkList.new
# 1.upto(5).each { |i| ll.add(i) }
# ll.print
# ll.reverse
# ll.print
