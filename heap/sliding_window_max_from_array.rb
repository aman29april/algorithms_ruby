# Given an array and an integer K, find the maximum for each and every contiguous subarray of size k.
# Examples :
# Input: arr[] = {1, 2, 3, 1, 4, 5, 2, 3, 6}, K = 3
# Output: 3 3 4 5 5 5 6
# Explanation:
# Maximum of 1, 2, 3 is 3
# Maximum of 2, 3, 1 is 3
# Maximum of 3, 1, 4 is 4 and so on.

def heapify_max(arr, index)
  left = index * 2 + 1
  right = index * 2 + 2
  max = index
  length = arr.length

  max = left if left < length && arr[left] > arr[max]
  max = right if right < length && arr[right] > arr[max]

  return if max == index

  arr[max], arr[index] = arr[index], arr[max]
  heapify_max(arr, max)
end

def build_heap(arr)
  length = arr.length
  start = length / 2 - 1
  start.downto(0).each do |i|
    heapify_max(arr, i)
  end
  arr
end

def max_sliding_window(nums, k)
  length = nums.length
  return [] if length < k

  heap = build_heap(nums[0, k])
  output = [heap[0]]
  Range.new(1, length - k).each do |i|
    output << build_heap(nums[i...i + k])[0]
  end
  output
end

ar = [1, 2, 3, 1, 4, 5, 2, 3, 6]
k = 3
puts max_sliding_window(ar, 3).to_s
