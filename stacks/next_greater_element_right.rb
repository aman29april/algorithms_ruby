# traverse array from left to right
def next_greater_elements1(nums)
  return [] if nums.empty?

  stack = []
  result = Array.new(nums.length, -1)
  nums.each_with_index do |num, index|
    while stack.any? && nums[stack.last] < num
      top = stack.pop
      result[top] = num
    end
    # Here we are pushing indices in stack
    stack.push index
  end
  result
end

# traverse array from right to left
def next_greater_elements(nums)
  return [] if nums.empty?

  stack = []
  length = nums.length
  result = Array.new(length, -1)
  (length - 1).downto(0).each do |index|
    num = nums[index]
    top = stack.pop while stack.any? && stack.last < num
    result[index] = stack.last if stack.any?

    # Here we are pushing values in stack
    stack.push num
  end
  result
end

# [2, -1, -1]
puts next_greater_elements([1, 2, 1]).to_s

# [2, 3, 4, -1, -1]
puts next_greater_elements([1, 2, 3, 4, 3]).to_s

# [5, 6, 6, 6, 7, -1, -1]
puts next_greater_elements([2, 5, -3, -4, 6, 7, 2]).to_s
