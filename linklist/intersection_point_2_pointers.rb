def getIntersectionNode(headA, headB)
  return nil if headA.nil? || headB.nil?

  a_pointer = headA
  b_pointer = headB

  # iterate till both pointers point to the same node
  while a_pointer != b_pointer

    # once a_pointer reaches end of the headA, point it to start of head B
    # for A = totally 5 nodes + 2 nodes to reach intersection point.
    a_pointer = if a_pointer.nil?
                  headB
                else
                  a_pointer.next
                end

    # once b_pointer reaches end of the headB, point it to start of head A
    # for B = totally 3 nodes + 4 nodes to reach intersection point.
    b_pointer = if b_pointer.nil?
                  headA
                else
                  b_pointer.next
                end
  end
  # at this point both of the pointers will be pointing to the same node.
  a_pointer
end
