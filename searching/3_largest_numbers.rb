# Similar to https://leetcode.com/problems/third-maximum-number/

# Method 1, using three variables
def three_largest_numbers1(nums)
  return if nums.length < 3

  first = -Float::INFINITY
  second = - Float::INFINITY
  third = -Float::INFINITY
  nums.each do |num|
    if num > first
      third = second
      second = first
      first = num
    elsif num > second
      third = second
      second = num
    elsif num > first
      third = num
    end
  end
  [first, second, third]
end

# Method 2, using array

def three_largest_numbers(nums)
  return if nums.length < 3

  largest = Array.new(3, -Float::INFINITY)
  nums.each do |value|
    if value > largest[2]
      shift_and_update(largest, value, 2)
    elsif value > largest[1]
      shift_and_update(largest, value, 1)
    elsif value > largest[0]
      shift_and_update(largest, value, 0)
    end
  end
  largest
end

def shift_and_update(array, value, idx)
  # shift values back from idx to 0
  0.upto(idx).each do |i|
    if i == idx
      array[idx] = value
    else
      array[i] = array[i + 1]
    end
  end
end

# [18, 141, 541]
puts three_largest_numbers([141, 1, 17, -7, -17, -27, 18, 541, 8, 7, 7]).to_s

puts three_largest_numbers([55, 7, 8]).to_s

puts three_largest_numbers([7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]).to_s

# [-2, -1, 7]
puts three_largest_numbers([-1, -2, -3, -7, -17, -27, -18, -541, -8, -7, 7]).to_s
