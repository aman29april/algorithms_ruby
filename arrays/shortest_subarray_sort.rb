# https://leetcode.com/problems/shortest-unsorted-continuous-subarray/
# Given an integer array nums, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order.

# Return the shortest such subarray and output its length.

# Example 1:

# Input: nums = [2,6,4,8,10,9,15]
# Output: 5
# Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.
# Example 2:

# Input: nums = [1,2,3,4]
# Output: 0

def find_unsorted_subarray(nums)
  return 0 if nums.length < 2

  min_out_of_order = Float::INFINITY
  max_out_of_order = -Float::INFINITY
  (0..nums.length - 1).each do |i|
    num = nums[i]
    if out_of_order? i, num, nums
      min_out_of_order = [num, min_out_of_order].min
      max_out_of_order = [num, max_out_of_order].max
    end
  end
  # if values are already sorted
  return 0 if min_out_of_order == Float::INFINITY

  # move left ptr till we reach index where we can place min out of order val
  left_id = 0
  left_id += 1 while nums[left_id] <= min_out_of_order

  right_id = nums.length - 1
  right_id -= 1 while nums[right_id] >= max_out_of_order

  right_id - left_id + 1
end

def out_of_order?(i, num, nums)
  if i.zero?
    num > nums[i + 1] # if first value is greater than second
  elsif i == nums.length - 1
    num < nums[i - 1] # last value lesser than 2nd last
  else
    num < nums[i - 1] || num > nums[i + 1] # value less than previous or greater than next
  end
end

puts find_unsorted_subarray([2, 6, 4, 8, 10, 9, 15])
puts find_unsorted_subarray([1, 2, 3, 4])
puts find_unsorted_subarray([2, 1])
puts find_unsorted_subarray([1, 3, 2, 3, 3])
