# Find the minimum element in a sorted and rotated array
# A sorted array is rotated at some unknown point, find the minimum element in it.
# The following solution assumes that all elements are distinct.

# Examples:

# Input: {5, 6, 1, 2, 3, 4}
# Output: 1

# Input: {1, 2, 3, 4}
# Output: 1

# Input: {2, 1}
# Output: 1

def min_sorted_rotated(ar)
  min = ar[0]
  (1..ar.length - 1).each do |i|
    if ar[i] < ar[i - 1]
      min = ar[i]
      break
    end
  end
  min
end

def min_sorted_binary_search(ar, low, high)
  # array not rotated at all
  return ar[0] if low > high

  # if only single element left
  return ar[low] if low == high

  mid = (high + low) / 2

  # Check if mid itself is minimum element
  return ar[mid] if ar[mid - 1] > ar[mid]

  if ar[low] > ar[high]
    min_sorted_binary_search(ar, mid + 1, high)
  else
    min_sorted_binary_search(ar, low, mid - 1)
  end
end

def min_sorted_binary2(ar, low, high)
  while low < high
    mid = (low + high) / 2
    if ar[mid] == ar[high]
      high -= 1
    elsif ar[mid] == ar[low]
      low += 1
    elsif ar[mid] > ar[high]
      low = mid + 1
    else
      high = mid
    end
  end
  ar[high]
end

ar = [5, 6, 1, 2, 3, 4]
puts min_sorted_binary2(ar, 0, ar.length - 1)

ar = [2, 3, 4, 5, 6, 7, 8, 1]
puts min_sorted_binary_search(ar, 0, ar.length - 1)

ar = [2, 1]
puts min_sorted_binary_search(ar, 0, ar.length - 1)

ar = [2]
puts min_sorted_binary_search(ar, 0, ar.length - 1)

ar = [2, 2, 2, 2, 3, 3, 3, 4]
puts min_sorted_binary_search(ar, 0, ar.length - 1)

# puts min_sorted_binary_search([1, 2, 3, 4, 5, 6, 7])

# puts min_sorted_binary_search [2, 3, 4, 5, 6, 7, 8, 1]

# puts min_sorted_binary_search [2, 1]

# puts min_sorted_binary_search [1]
