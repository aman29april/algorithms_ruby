# https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
# Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
# If target is not found in the array, return [-1, -1].
# You must write an algorithm with O(log n) runtime complexity.
# Example 1:
# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]

def search_range(nums, target)
  output_range = []
  # try to go left
  output_range << binary_search_helper(nums, target, true)

  # go right
  output_range << binary_search_helper(nums, target, false)
  output_range
end

def binary_search_helper(nums, target, go_left)
  left = 0
  right = nums.length - 1
  while left <= right
    mid = (left + right) / 2
    if target > nums[mid]
      left = mid + 1
    elsif target < nums[mid]
      right = mid - 1
    elsif go_left
      if mid.zero? || nums[mid - 1] != target
        return mid
      else
        right = mid - 1
      end
    elsif mid == nums.length - 1 || nums[mid + 1] != target
      return mid
    else
      left = mid + 1
    end
  end
  -1
end

# [-1, -1]
puts search_range([5, 7, 7, 8, 8, 10], 6).to_s

puts search_range([0, 1, 21, 33, 45, 45, 45, 45, 45, 45, 61, 71, 73], 45).to_s

# [3,4]
puts search_range([5, 7, 7, 8, 8, 10], 8).to_s
