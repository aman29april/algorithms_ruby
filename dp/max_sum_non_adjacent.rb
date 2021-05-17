# Given an array of integers, find the maximum sum of non-adjacent elements.
# Consider the array 1,0,3,9,2 . The maximum sum would be (1+9)=10
# Again, consider the array 2,4,6,2,5. The maximum should be (2+6+5)=13

def max_sum_non_adjacent(arr)
  return 0 if arr.empty?
  return arr[0] if arr.length == 1

  # base case, 1st element will be as it is
  sums = [arr[0]]

  # 2nd element will be max of 1st two numbers
  sums[1] = arr[0..1].max

  (2...arr.length).each do |i|
    # max of previous element and (current array element + 2nd previous element)
    sums[i] = [sums[i - 1], arr[i] + sums[i - 2]].max
  end

  sums[-1]
end

puts max_sum_non_adjacent([75, 105, 120, 75, 90, 135])
puts max_sum_non_adjacent([5, 5, 10, 100, 10, 5])
puts max_sum_non_adjacent([1, 2, 3])
puts max_sum_non_adjacent([1, 20, 3])
