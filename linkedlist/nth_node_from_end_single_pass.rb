# Solution 1
# def remove_nth_from_end(head, n)
#   return nil if head.nil? || head.next.nil?

#   ptr1 = head
#   ptr2 = head
#   count = 0
#   while count < n
#     ptr1 = ptr1.next
#     count += 1
#   end

#   return head.next if count == n && ptr1.nil?

#   while ptr1 && ptr1.next
#     ptr1 = ptr1.next
#     ptr2 = ptr2.next
#   end

#   ptr2.next = ptr2.next.next
#   head
# end

# Similar and compact solution
def remove_nth_from_end(head, n)
  return nil unless head.next

  count = 0
  ptr1 = head
  ptr2 = head
  while ptr1
    ptr1 = ptr1.next
    ptr2 = ptr2.next if count > n
    count += 1
  end
  # if 1st noe is to be deleted
  return head.next if count == n

  ptr2.next = ptr2.next.next
  head
end
