
# using brutforce
def index_equals_value_bforce(nums)
  nums.each_with_index do |n, index|
    return index if n == index
  end
  -1
end

def index_equals_value_bsearch(nums)
  left = 0
  right = nums.length - 1
  while left <= right
    mid = (left + right) / 2
    # 1st occurance at zero index
    if nums[mid] == mid && mid.zero?
      return mid
    elsif nums[mid] == mid && nums[mid-1] < mid - 1
      return mid
    elsif nums[mid] < mid
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end

# 3
puts index_equals_value_bsearch([-5, -3, 0, 3, 4, 5, 9])

#4
puts index_equals_value_bsearch([-5, -3, 0, 2, 4, 5, 9])

#-1
puts index_equals_value_bsearch([-5, -3, 0, 2, 5, 6, 19])
