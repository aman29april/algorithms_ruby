# Write a function that takes in an array of distinct integers as well as an integer k and that returns the kth smallest integer in that array.

# The function should do this in linear time, on average.

# Sample Input
# array = [8, 5, 2, 9, 7, 6, 3]
# k = 3
# Sample Output
# 5
#

def quick_select(nums, k)
  pos = k - 1
  return if nums.empty? || nums.length < pos

  quick_select_helper(nums, pos, 0, nums.length - 1)
end

def quick_select_helper(nums, pos, start, ending)
  while start <= ending
    pivot = start
    left = start + 1
    right = ending

    while right >= left
      if nums[left] > nums[pivot] && nums[right] < nums[pivot]
        swap(nums, left, right)
      elsif nums[left] <= nums[pivot]
        left += 1
      elsif nums[right] >= nums[pivot]
        right -= 1
      end
    end

    swap(nums, pivot, right)
    if pos == right
      return nums[right]
    elsif right < pos
      start = right + 1
    else
      ending = right - 1
    end
  end
end

def swap(ar, i, j)
  ar[i], ar[j] = ar[j], ar[i]
end

# 5
puts quick_select([8, 5, 2, 9, 7, 6, 3], 3)

# 1
puts quick_select([1], 1)

# 24
puts quick_select([43, 24, 37], 1)

# 2
puts quick_select([8, 3, 2, 5, 1, 7, 4, 6], 2)
