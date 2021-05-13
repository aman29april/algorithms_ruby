require_relative './heap'
# def heapify_max(arr, index)
#   length = arr.length
#   left =
# end

# def build_heap(arr)
#   length = arr.length
#   start = length / 2 - 1
#   start.downto(0).each do |i|
#     heapify_max(arr,i)
#   end
# end

# kth largest element using max heap
def find_kth_largest(nums, k)
  length = nums.length
  return if length < k

  heap = Heap.new(nums)
  heap.print
  max = nil
  k.times do
    max = heap.poll
  end
  max
end

nums = [3, 2, 1, 5, 6, 4]
k = 3
puts find_kth_largest(nums, k)
