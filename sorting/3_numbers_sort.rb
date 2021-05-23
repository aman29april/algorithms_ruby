# https://leetcode.com/problems/sort-colors/
#

def three_number_sort(nums, order)
  return nums if nums.length <= 1

  first = 0
  second = 0
  third = nums.length - 1

  while second <= third
    value = nums[second]
    if value == order[0]
      swap(nums, first, second)
      first += 1
      second += 1
    elsif value == order[1]
      second += 1
    elsif value == order[2]
      swap(nums, second, third)
      third -= 1
    end
  end
  nums
end

def swap(arr, i, j)
  arr[i], arr[j] = arr[j], arr[i]
end

puts three_number_sort([1, 0, 0, -1, -1, 0, 1, 1], [0, 1, -1]).to_s

puts three_number_sort([-2, -3, -3, -3, -3, -3, -2, -2, -3], [-2, -3, 0]).to_s
