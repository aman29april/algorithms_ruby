# Write a function that takes in a non-empty array of distinct integers and an integer representing a target sum. The function should find all triplets in the array that sum up to the target sum and return a two-dimensional array of all these triplets. The numbers in each triplet should be ordered in ascending order, and the triplets themselves should be ordered in ascending order with respect to the numbers they hold.

# If no three numbers sum up to the target sum, the function should return an empty array.

# Sample Input
# array = [12, 3, 1, 2, -6, 5, -8, 6]
# targetSum = 0
# Sample Output
# [[-8, 2, 6], [-8, 3, 5], [-6, 1, 5]]
require 'set'

def three_number_sum(nums, target)
  return if nums.length < 3

  output =  []
  nums.sort!
  Range.new(0, nums.length - 2).each do |i|
    left = i + 1
    right = nums.length - 1
    while left < right
      sum = nums[i] + nums[left] + nums[right]
      if sum == target
        output << [nums[i], nums[left], nums[right]]
        left += 1
        right -= 1
      elsif sum < target
        left += 1
      else
        right -= 1
      end
    end
  end
  output.to_a
end

# Leet code solution.
# Here the variation is, nums can have dublicate values and output should have uniq valeus only
# target here is zero
# https://leetcode.com/problems/3sum/
def three_sum(nums)
  target = 0

  return [] if nums.length < 3
  return [[0, 0, 0]] if nums.uniq == [0]

  output = Set.new []
  nums.sort!
  (0..(nums.length - 3)).each do |i|
    left = i + 1
    right = nums.length - 1
    while left < right
      sum = nums[i] + nums[left] + nums[right]
      if sum == target
        output << [nums[i], nums[left], nums[right]]
        left += 1
        right -= 1
      elsif sum < target
        left += 1
      else
        right -= 1
      end
    end
  end
  output.to_a
end

puts three_number_sum([12, 3, 1, 2, -6, 5, -8, 6], 0).to_s
puts three_number_sum([1, 2, 3], 7).to_s
puts three_number_sum([1, 2, 3, 4, 5, 6, 7, 8, 9, 15], 18).to_s
