# https://leetcode.com/problems/third-maximum-number/
# Given integer array nums, return the third maximum number in this array. If the third maximum does not exist, return the maximum number.

# Example 1:

# Input: nums = [3,2,1]
# Output: 1
# Explanation: The third maximum is 1.
# Example 2:

# Input: nums = [1,2]
# Output: 2
# Explanation: The third maximum does not exist, so the maximum (2) is returned instead.

def third_max(nums)
  first = -Float::INFINITY
  second = -Float::INFINITY
  third = -Float::INFINITY
  nums.each do |num|
    if num > first
      third = second
      second = first
      first = num
    elsif num > second && num < first
      third = second
      second = num
    elsif num > third && num < second
      third = num
    end
  end
  third == -Float::INFINITY ? first : third
end

puts third_max([2, 2, 3, 1])
puts third_max([1, 2])
puts third_max([3, 2, 1])
