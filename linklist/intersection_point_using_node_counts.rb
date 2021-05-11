def getIntersectionNode(headA, headB)
  return nil if headA.nil? || headB.nil?

  l1 = length(headA)
  l2 = length(headB)
  diff = (l1 - l2).abs

  if l1 > l2
    largerH = headA
    smallerH = headB
  else
    largerH = headB
    smallerH = headA
  end

  while largerH.next && diff > 0
    largerH = largerH.next
    diff -= 1
  end

  while largerH != smallerH
    largerH = largerH.next
    smallerH = smallerH.next
  end
  largerH
end

def length(node)
  return 0 if node.nil?

  count = 0
  while node
    count += 1
    node = node.next
  end
  count
end
