def count_inversions(arr)
  count_subarray_inversions(arr, 0, arr.length)
end

def count_subarray_inversions(arr, start, ending)
  return 0 if ending - start <= 1

  mid = start + (ending - start) / 2
  left_inv = count_subarray_inversions(arr, start, mid)
  right_inv = count_subarray_inversions(arr, mid, ending)
  merged_inv = merge_and_count_inv(arr, start, mid, ending)
  left_inv + right_inv + merged_inv
end

def merge_and_count_inv(arr, start, mid, ending)
  left = start
  right = mid
  sorted_array = []
  inversions = 0
  while left < mid && right < ending
    if arr[left] <= arr[right]
      sorted_array << arr[left]
      left += 1
    else
      # number of elements that are remaining in left subarray
      inversions += (mid - left)
      sorted_array << arr[right]
      right += 1
    end
  end
  while left < mid
    sorted_array << arr[left]
    left += 1
  end

  while right < ending
    sorted_array << arr[right]
    right += 1
  end
  (0..sorted_array.length - 1).each do |i|
    arr[start + i] = sorted_array[i]
  end

  puts arr.to_s
  inversions
end

puts count_inversions([2, 3, 3, 1, 9, 5, 6]) # 5

puts count_inversions([0, 2, 4, 5, 76]) # 0

puts count_inversions([2, 2, 2, 2, 1, 1, 1, 1, 3, 3, 3, 3]) # 16
