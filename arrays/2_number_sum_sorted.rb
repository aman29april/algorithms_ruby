# https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/submissions/
#
# Given an array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number.

# Return the indices of the two numbers (1-indexed) as an integer array answer of size 2, where 1 <= answer[0] < answer[1] <= numbers.length.

# The tests are generated such that there is exactly one solution. You may not use the same element twice.

# Example 1:

# Input: numbers = [2,7,11,15], target = 9
# Output: [1,2]
# Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.

def two_sum(nums, target)
  return nums if nums.length < 2

  left = 0
  right = nums.length - 1
  while left < right
    left += 1 while (nums[left] == nums[left - 1]) && (left > 0)
    right -= 1 while (nums[right] == nums[right + 1]) && (right < nums.length - 1)

    pair = [nums[left], nums[right]]
    sum = pair.sum
    if target == sum
      return [left + 1, right + 1]
    elsif target > sum
      left += 1
    else
      right -= 1
    end
  end
  []
end

puts two_sum([2, 7, 11, 15], 9).to_s
