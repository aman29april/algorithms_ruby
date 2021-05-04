# largest product subarray
# Given an array that contains both positive and negative integers, find the product of the maximum product subarray. Expected Time complexity is O(n) and only O(1) extra space can be used.

# Examples:

# Input: arr[] = {6, -3, -10, 0, 2}
# Output:   180  // The subarray is {6, -3, -10}

# Input: arr[] = {-1, -3, -10, 0, 60}
# Output:   60  // The subarray is {60}

# Input: arr[] = {-2, -40, 0, -2, -3}
# Output:   80  // The subarray is {-2, -40}

def largest_product_brutforce(ar)
  max = 0
  prod = 0
  (0..ar.length - 2).each do |i|
    prod = 1
    (i..ar.length - 1).each do |j|
      prod *= ar[j]
      max = prod if max < prod
    end
  end
  max
end

def largest_product_subarray(ar)
  max_till_now = 0
  max_ending_here = 0
  ar.each do |e|
    if e == 0
      max_ending_here = 0
      next
    end

    if max_ending_here == 0
      max_ending_here = e
    else
      max_ending_here *= e
    end

    max_till_now = max_ending_here if max_ending_here > max_till_now
  end
  max_till_now
end

# puts largest_product_subarray([6, -3, -10, 0, 2])

puts largest_product_subarray([0, 0, -10, 0, 0])
