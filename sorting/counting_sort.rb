# works for negative numbers as well
def counting_sort(arr)
  min = arr.min
  max = arr.max

  range = max - min + 1
  count_arr = Array.new(range, 0)
  output_arr = Array.new(arr.length, 0)
  # build frequency array
  arr.each do |val|
    count_arr[val - min] += 1
  end

  # cumulative sum of frequencies
  (1..count_arr.length - 1).each do |i|
    count_arr[i] += count_arr[i - 1]
  end
  (arr.length - 1).downto(0).each do |i|
    val = arr[i]
    pos = count_arr[val - min]
    output_arr[pos - 1] = val
    count_arr[val - min] -= 1
  end

  (0..arr.length - 1).each do |i|
    arr[i] = output_arr[i]
  end
  arr
end

puts counting_sort([-5, -10, 0, -3, 8, 5, -1, 10]).to_s
puts counting_sort([1, 4, 1, 2, 7, 5, 2]).to_s
puts counting_sort([4, 3, 2, 5, 4, 3, 5, 1, 0, 2, 5]).to_s
