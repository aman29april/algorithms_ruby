# https://leetcode.com/problems/longest-mountain-in-array/
# You may recall that an array arr is a mountain array if and only if:

# arr.length >= 3
# There exists some index i (0-indexed) with 0 < i < arr.length - 1 such that:
# arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
# arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
# Given an integer array arr, return the length of the longest subarray, which is a mountain. Return 0 if there is no mountain subarray.

# Example 1:

# Input: arr = [2,1,4,7,3,2,5]
# Output: 5
# Explanation: The largest mountain is [1,4,7,3,2] which has length 5.
#
#
# def find_peak_element(arr)
#   return false if arr.length < 3

#   max = 0
#   i = 1
#   while i < arr.length - 1
#     while arr[i] <= arr[i - 1] && i < arr.length - 1
#       i += 1
#     end

#     count = 0
#     while arr[i] > arr[i - 1] && i < arr.length - 1
#       count += 1
#       i += 1
#     end
#     while arr[i] < arr[i - 1] && i < arr.length - 1
#       i += 1
#       count += 1
#     end
#     max = [max, count].max
#   end
#   max
# end
#
def find_peak_element(arr)
  return 0 if arr.length < 3

  max_peak = 0

  i = 1
  while i < arr.length - 1
    is_peak = arr[i] > arr[i - 1] && arr[i] > arr[i + 1]
    unless is_peak
      i += 1
      next
    end

    left_id = i - 2
    left_id -= 1 while left_id >= 0 && arr[left_id] < arr[left_id + 1]

    right_id = i + 2
    right_id += 1 while right_id < arr.length && arr[right_id] < arr[right_id - 1]

    length = right_id - left_id - 1
    max_peak = [max_peak, length].max
    i = right_id
  end
  max_peak
end

puts find_peak_element([1, 2, 1, 3, 5, 6, 4])

puts find_peak_element([1, 2, 3, 1])
puts find_peak_element([2, 1, 4, 7, 3, 2, 5])
puts find_peak_element([2, 2, 2])
