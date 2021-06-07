# https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
# Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
# If target is not found in the array, return [-1, -1].
# You must write an algorithm with O(log n) runtime complexity.
# Example 1:
# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]
#

# recursive solution
def search_range(nums, target)
  output_range = [-1, -1]
  # try to go left
  binary_search_helper(nums, target, 0, nums.length - 1, output_range, true)

  # go right
  binary_search_helper(nums, target, 0, nums.length - 1, output_range, false)
  output_range
end

# recursive solution
def binary_search_helper(nums, target, left, right, output_range, go_left)
  return if left > right

  mid = (left + right) / 2
  if target > nums[mid]
    binary_search_helper(nums, target, mid + 1, right, output_range, go_left)
  elsif target < nums[mid]
    binary_search_helper(nums, target, left, mid - 1, output_range, go_left)
  elsif go_left
    # if value found at mid, we will try to go left or right
    if mid.zero? || nums[mid - 1] != target
      output_range[0] = mid
    else
      binary_search_helper(nums, target, left, mid - 1, output_range, go_left)
    end
  # if we are at 1st value or previous value is not same as target
  # means we have found the start of the range value
  elsif mid == nums.length - 1 || target != nums[mid + 1]
    # we have reached at end of array or the next value is not equal to target
    # we have found end of the range
    output_range[1] = mid
  else
    binary_search_helper(nums, target, mid + 1, right, output_range, go_left)
  end
end

puts search_range([5, 7, 7, 8, 8, 10], 6).to_s

puts search_range([0, 1, 21, 33, 45, 45, 45, 45, 45, 45, 61, 71, 73], 45).to_s
