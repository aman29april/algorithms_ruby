# https://leetcode.com/problems/next-greater-element-ii/
# Given a circular integer array nums (i.e., the next element of nums[nums.length - 1] is nums[0]),
# return the next greater number for every element in nums.
# The next greater number of a number x is the first greater number to its traversing-order next in the array,
# which means you could search circularly to find its next greater number. If it doesn't exist, return -1 for this number.

# Example 1:
# Input: nums = [1,2,1]
# Output: [2,-1,2]
# Explanation: The first 1's next greater number is 2;
# The number 2 can't find next greater number.
# The second 1's next greater number needs to search circularly, which is also 2.
# Example 2:

# Input: nums = [1,2,3,4,3]
# Output: [2,3,4,-1,4]

def next_greater_elements(nums)
  length = nums.length
  output = Array.new(nums.length, -1)
  stack = []
  # traverse array twice.
  Range.new(0, length * 2).each do |idx|
    circular_id = idx % length
    while stack.any? && nums[stack[-1]] < nums[circular_id]
      top = stack.pop
      output[top] = nums[circular_id]
    end
    stack.push circular_id
  end
  output
end

# [2,-1,2]
puts next_greater_elements([1, 2, 1]).to_s

# [2,3,4,-1,4]
puts next_greater_elements([1, 2, 3, 4, 3]).to_s

# [5, 6, 6, 6, 7, -1, 5]
puts next_greater_elements([2, 5, -3, -4, 6, 7, 2]).to_s
