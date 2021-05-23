# https://leetcode.com/problems/longest-consecutive-sequence/
# Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

# Example 1:

# Input: nums = [100,4,200,1,3,2]
# Output: 4
# Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
# Example 2:

# Input: nums = [0,3,7,2,5,8,4,6,0,1]
# Output: 9
#

def longest_consecutive(nums)
  return nums.length if nums.length < 2

  hash = {}
  nums.each { |val| hash[val] = true }
  max = 0
  nums.each do |val|
    next if hash[val] == false

    hash[val] = false
    nxt = val + 1
    prev = val - 1
    length = 1
    while hash.key? nxt
      length += 1
      hash[nxt] = false
      nxt += 1
    end

    while hash.key? prev
      length += 1
      hash[prev] = false
      prev -= 1
    end

    max = [max, length].max
  end
  max
end

puts longest_consecutive([100, 4, 200, 1, 3, 2])
puts longest_consecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1])
