def next_smallest_element_right(nums)
  return nums if nums.empty?

  stack = []
  output = Array.new(nums.length, -1)

  nums.each_with_index do |num, index|
    stack.pop while stack.any? && stack.last >= num
    output[index] = stack.last if stack.any?
    stack.push num
  end
  output
end

puts next_smallest_element_right([1, 2, 1]).to_s

puts next_smallest_element_right([1, 2, 3, 4, 3]).to_s

puts next_smallest_element_right([2, 5, -3, -4, 6, 7, 2]).to_s
