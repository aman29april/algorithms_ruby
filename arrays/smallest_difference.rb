# https://www.algoexpert.io/questions/Smallest%20Difference
# Write a function that takes in two non-empty arrays of integers, finds the pair of numbers (one from each array) whose absolute difference is closest to zero, and returns an array containing these two numbers, with the number from the first array in the first position.

# Note that the absolute difference of two integers is the distance between them on the real number line. For example, the absolute difference of -5 and 5 is 10, and the absolute difference of -5 and -4 is 1.

# You can assume that there will only be one pair of numbers with the smallest difference.

# Sample Input
# arrayOne = [-1, 5, 10, 20, 28, 3]
# arrayTwo = [26, 134, 135, 15, 17]
# Sample Output
# [28, 26]

def smallest_difference(array1, array2)
  array1.sort!
  array2.sort!
  ptr1 = 0
  ptr2 = 0
  smallest_pair = []
  smallest = Float::INFINITY
  while ptr1 < array1.length && ptr2 < array2.length
    firstNum = array1[ptr1]
    secondNum = array2[ptr2]
    puts [firstNum, secondNum].to_s
    if firstNum < secondNum
      ptr1 += 1
    elsif secondNum < firstNum
      ptr2 += 1
    else
      # difference is zero
      return [firstNum, secondNum]
    end
    current_diff = (firstNum - secondNum).abs
    if current_diff < smallest
      smallest = current_diff
      smallest_pair = [firstNum, secondNum]
    end
  end
  smallest_pair
end

puts smallest_difference([-1, 5, 10, 20, 28, 3], [26, 134, 135, 15, 17]).to_s
