# def quick_sort(arr)
#   quick_sort_helper2(arr, 0, arr.length - 1)
#   arr
# end
#
# def quick_sort_helper(arr, low, high)
#   return if low >= high
#
#   pivot = arr[high]
#   pi = partition(arr, pivot, low, high)
#   quick_sort_helper(arr, low, pi - 1)
#   quick_sort_helper(arr, pi + 1, high)
# end
#
# def partition(arr, pivot, low, high)
#   i = low
#   j = low
#   while i <= high
#     if arr[i] <= pivot
#       arr[i], arr[j] = arr[j], arr[i]
#       j += 1
#     end
#     i += 1
#   end
#   j - 1
# end
#
# def quick_sort_helper2(arr, low, high)
#   return if low >= high
#
#   pivot = low
#   left = low + 1
#   right = high
#   while right >= left
#     if arr[left] > arr[pivot] && arr[right] < arr[pivot]
#       swap(arr, left, right)
#     elsif arr[left] <= arr[pivot]
#       left += 1
#     elsif arr[right] >= arr[pivot]
#       right -= 1
#     end
#   end
#   swap(arr, right, pivot)
#
#   is_left_subarray_smaller = high - right + 1 > left - low - 1
#   # we are sorting smaller subarray first
#   if is_left_subarray_smaller
#     quick_sort_helper2(arr, left, right - 1)
#     quick_sort_helper2(arr, right + 1, high)
#   else
#     quick_sort_helper2(arr, right + 1, high)
#     quick_sort_helper2(arr, left, right - 1)
#   end
# end
#
# def swap(arr, i, j)
#   arr[i], arr[j] = arr[j], arr[i]
# end
#

def quick_sort(ar)

end


def partition(ar, low, high)

  pivot = ar[high]

  i = low
  j = low

  while i <= high
    if ar[i] < pivot
      swap(ar, i, j)
      i += 1
      j += 1
    else
      j += 1
    end
  end
  j-1
end

def swap(ar, i,j)
  ar[i], ar[j] = ar[j], ar[i]
end
# puts quick_sort([9, 30, 2, 88, 3, 98, 45]).to_s
