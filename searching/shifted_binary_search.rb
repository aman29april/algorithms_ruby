# https://leetcode.com/problems/search-in-rotated-sorted-array/submissions/

def shifted_binary_search(arr, target)
  shifted_binary_search_helper(arr, target, 0, arr.length - 1)
end

# recursive solution
def shifted_binary_search_helper(arr, target, left, right)
  return -1 if left > right

  mid = (left + right) / 2

  left_num = arr[left]
  right_num = arr[right]
  mid_num = arr[mid]
  if target == mid_num
    mid
  elsif left_num <= mid_num
    if target >= left_num && target < mid_num
      shifted_binary_search_helper(arr, target, left, mid - 1)
    else
      shifted_binary_search_helper(arr, target, mid + 1, right)
    end
  elsif target > mid_num && target <= right_num
    shifted_binary_search_helper(arr, target, mid + 1, right)
  else
    shifted_binary_search_helper(arr, target, left, mid - 1)
  end
end

def shifted_binary_search_iterative(arr, target)
  left = 0
  right = arr.length - 1

  while left <= right
    mid = (left + right) / 2
    left_num = arr[left]
    right_num = arr[right]
    mid_num = arr[mid]
    if target == mid_num
      return mid
    elsif left_num <= mid_num
      if target >= left_num && target < mid_num
        right = mid - 1
      else
        left = mid + 1
      end
    elsif target > mid_num && target <= right_num
      left = mid + 1
    else
      right = mid - 1
    end

  end
  -1
end

# 8
puts shifted_binary_search([45, 61, 71, 72, 73, 0, 1, 21, 33, 37], 33)

# 2
puts shifted_binary_search([5, 23, 111, 1], 111)

# -1
puts shifted_binary_search([23, 111, 1, 5], 35)

# 2
puts shifted_binary_search([5, 1, 3], 3)

# 8
puts shifted_binary_search_iterative([45, 61, 71, 72, 73, 0, 1, 21, 33, 37], 33)

# 2
puts shifted_binary_search_iterative([5, 23, 111, 1], 111)

# -1
puts shifted_binary_search_iterative([23, 111, 1, 5], 35)

# 2
puts shifted_binary_search_iterative([5, 1, 3], 3)
