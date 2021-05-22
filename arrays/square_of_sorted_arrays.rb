# https://leetcode.com/problems/squares-of-a-sorted-array/
# 977. Squares of a Sorted Array
# Given an integer array nums sorted in non-decreasing order,
# return an array of the squares of each number sorted in non-decreasing order.

# Example 1:

# Input: nums = [-4,-1,0,3,10]
# Output: [0,1,9,16,100]
# Explanation: After squaring, the array becomes [16,1,0,9,100].
# After sorting, it becomes [0,1,9,16,100].

def sorted_squares(nums)
  return nums if nums.empty?

  nums.map { |n| n**2 }.sort
end

# Solution 2
# O(N), No sorting required
def sorted_squares(nums)
  return nums if nums.empty?

  output = []
  length = nums.length
  left = 0
  right = length - 1
  (length - 1).downto(0).each do |index|
    if nums[left].abs > nums[right].abs
      output[index] = nums[left]**2
      left += 1
    else
      output[index] = nums[right]**2
      right -= 1
    end
  end
  output
end
