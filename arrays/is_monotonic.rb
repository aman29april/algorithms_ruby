# https://leetcode.com/problems/monotonic-array/
# An array is monotonic if it is either monotone increasing or monotone decreasing.

# An array nums is monotone increasing if for all i <= j, nums[i] <= nums[j].  An array nums is monotone decreasing if for all i <= j, nums[i] >= nums[j].

# Return true if and only if the given array nums is monotonic.

# Example 1:

# Input: nums = [1,2,2,3]
# Output: true
# Example 2:

# Input: nums = [6,5,4,4]
# Output: true
# soltution 1
#
# def is_monotonic(nums)
#   return true if nums.empty? || nums.length == 1

#   increasing = nil

#   prev = nums[0]
#   (1..(nums.length - 1)).each do |i|
#     current = nums[i]
#     next if prev == current

#     increasing = current > prev if increasing.nil?
#     return false if  increasing && prev >= current

#     return false if !increasing && current >= prev

#     prev = current
#   end
#   true
# end

# solution 2
def is_monotonic(a)
  (1...a.length).each do |i|
    if a[i] > a[i - 1]
      ascending = true
    elsif a[i] < a[i - 1]
      descending = true
    end
    return false if ascending && descending
  end

  true
end
