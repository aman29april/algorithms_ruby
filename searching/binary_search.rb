# Recursive solution
def b_search(ar, target, l, r)
  # l, r = 0, ar.length-1
  mid = (l + r) / 2
  return true if ar[mid] == target
  return false if l > r
  return b_search(ar, target, l, mid - 1) if target < ar[mid]
  return b_search(ar, target, mid + 1, r) if target > ar[mid]
end

# returns index of target if found
# iterative solution
def binary_search(arr, target)
  left = 0
  right = arr.length - 1
  while left <= right
    mid = (left + right) / 2
    return mid if target == arr[mid]

    if target < arr[mid]
      right = mid - 1
    else
      left = mid + 1
    end
  end
end

ar = [1, 3]
search = 3
start = 0
puts b_search(ar, search, start, ar.length - 1)

puts binary_search([0, 1, 21, 33, 45, 45, 61, 71, 72, 73], 33)
puts binary_search([1, 5, 23, 111], 99)
