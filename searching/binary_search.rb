def b_search(ar, target, l, r)
  # l, r = 0, ar.length-1
  mid = (l + r) / 2
  puts mid
  return true if ar[mid] == target
  return false if l > r
  return b_search(ar, target, l, mid - 1) if target < ar[mid]
  return b_search(ar, target, mid + 1, r) if target > ar[mid]
end

ar = [1, 3]
search = 3
start = 0
puts b_search(ar, search, start, ar.length - 1)
