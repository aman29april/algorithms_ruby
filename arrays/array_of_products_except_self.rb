# https://leetcode.com/problems/product-of-array-except-self/
# Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

# You must write an algorithm that runs in O(n) time and without using the division operation.

# def product_except_self(nums)
#   product = nums.inject(1) { |product, num| product * num }
#   nums.map { |n| n.zero? ? product : product / n }
# end

# def product_except_self(nums)
#   return nums if nums.empty?

#   left = 1
#   right = 1
#   output = []
#   nums.each_with_index do |num, i|
#     right = 1
#     Range.new(i + 1, nums.length - 1).each do |j|
#       right *= nums[j]
#     end
#     output[i] = left * right
#     left *= num
#   end
#   output
# end
#
def product_except_self_1(nums)
  return nums if nums.empty?

  length = nums.length
  left_products = Array.new(length, 1)
  left_products[1] = nums[0]

  right_products = Array.new(length, 1)
  right_products[length - 2] = nums[-1]
  (2..length - 1).each do |i|
    left_products[i] = nums[i - 1] * left_products[i - 1]
  end

  (length - 2).downto(0).each do |i|
    right_products[i] = nums[i + 1] * right_products[i + 1]
  end

  (0..length - 1).each do |i|
    nums[i] = left_products[i] * right_products[i]
  end
  nums
end

def product_except_self(nums)
  return nums if nums.empty?

  length = nums.length

  output = Array.new(length, 1)
  left_running_prod = 1

  # We filled left products first. Loop from L to R
  (0..length - 1).each do |i|
    output[i] = left_running_prod
    left_running_prod *= nums[i]
  end

  # Loop from R to L, we will now multiple right products
  right_running_prod = 1
  (length - 1).downto(0).each do |i|
    output[i] *= right_running_prod
    right_running_prod *= nums[i]
  end
  output
end

puts product_except_self([1, 2, 3, 4]).to_s

puts product_except_self([-1, 1, 0, -3, 3]).to_s

puts product_except_self([-1, 1, 0, -3, 3]).to_s
