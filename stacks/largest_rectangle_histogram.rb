# https://leetcode.com/problems/largest-rectangle-in-histogram/
# Given an array of integers heights representing the histogram's bar height where the width of each bar is 1,
# return the area of the largest rectangle in the histogram.

# Example 1:
# Input: heights = [2,1,5,6,2,3]
# Output: 10
# Explanation: The above is a histogram where width of each bar is 1.
# The largest rectangle is shown in the red area, which has an area = 10 units.

# Input: heights = [2,4]
# Output: 4

# we will try to expand from each building.
# on left of a building, we can expand till 1st smallest building on left. Similarly on right building we can expand till next smallest on right
# so for each building we will find next smallest on left and right
# then we will compute possible area for each building and find max
def largest_rectangle_area(heights)
  length = heights.length
  left_boundary = Array.new(length, -1)
  right_boundary = Array.new(length, length)
  stack = []

  # find next min on left
  heights.each_with_index do |height, index|
    stack.pop while stack.any? && heights[stack.last] >= height
    left_boundary[index] = stack.last if stack.any?
    stack.push index
  end

  # find next min on right
  stack = []
  (length - 1).downto(0).each do |index|
    height = heights[index]
    stack.pop while stack.any? && heights[stack.last] >= height
    right_boundary[index] = stack.last if stack.any?
    stack.push index
  end


  # find area
  max_area = 0
  length.times.each do |index|
    width = right_boundary[index] - left_boundary[index] - 1
    area = width * heights[index]
    max_area = [max_area, area].max
  end
  max_area
end

puts largest_rectangle_area([2, 1, 5, 6, 2, 3]).to_s
puts largest_rectangle_area([2, 4]).to_s
