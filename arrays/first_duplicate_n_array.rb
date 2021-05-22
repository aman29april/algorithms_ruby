# https://www.geeksforgeeks.org/find-duplicates-constant-array-elements-0-n-1-o1-space/
# Given an array of integers between 1 and n, inclusive, where n is the length of the array, write a function that returns the first integer that appears more than once
# (when the array is read from left to right).

# In other words, out of all the integers that might occur more than once in the input array,
# your function should return the one whose first duplicate value has the minimum index.

# If no integer appears more than once, your function should return -1.

# Note that you're allowed to mutate the input array.

# Sample Input #1
# array = [2, 1, 5, 2, 3, 3, 4]
# Sample Output: 2

def fist_duplicate_n_array(nums)
  return -1 if nums.empty?

  nums.each do |_num|
    abs_n = nums.abs
    return abs_n if nums[abs_n - 1].negative?

    nums[abs_n - 1] *= -1
  end
  -1
end

# using slow and fast pointers
# This is consider array with elements 1 to n - 1
# https://leetcode.com/problems/find-the-duplicate-number/submissions/
def find_duplicate(nums)
  return -1 if nums.empty?

  slow = nums[0]
  fast = nums[nums[0]]
  while fast != slow
    slow = nums[slow]
    fast = nums[nums[fast]]
  end

  slow = 0
  while slow != fast
    slow = nums[slow]
    fast = nums[fast]
  end

  fast
end

puts fist_duplicate_n_array([2, 1, 5, 2, 3, 3, 4])

puts fist_duplicate_using_cycle_detection([2, 1, 5, 2, 3, 3, 4])
