def getIntersectionNode(headA, headB)
  return nil if headA.nil? || headB.nil?

  visited = {}
  while headA
    visited[headA.object_id] = true
    headA = headA.next
  end

  while headB
    return headB if visited.has_key? headB.object_id

    headB = headB.next
  end
  nil
end
