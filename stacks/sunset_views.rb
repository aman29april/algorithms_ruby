# Given an array of buildings and a direction that all of the buildings face, return an array of the indices of the buildings that can see the sunset.
# A building can see the sunset if it's strictly taller than all of the buildings that come after it in the direction that it faces.
# The input array named buildings contains positive, non-zero integers representing the heights of the buildings. A building at index i thus has a height denoted by buildings[i].
# All of the buildings face the same direction, and this direction is either east or west, denoted by the input string named direction, which will always be equal to either "EAST" or "WEST".
# In relation to the input array, you can interpret these directions as right for east and left for west.
# Important note: the indices in the output array should be sorted in ascending order.

# Input #1
# buildings = [3, 5, 4, 4, 3, 1, 3, 2]
# direction = "EAST"
# Output #1
# [1, 3, 6, 7]
# Below is a visual representation of the sample input.
# //    _
# //   | |_ _
# //  _| | | |_   _
# // | | | | | | | |_
# // | | | | | |_| | |
# // |_|_|_|_|_|_|_|_|

# Input #2
# buildings = [3, 5, 4, 4, 3, 1, 3, 2]
# direction = "WEST"
# Output #2
# [0, 1]

# // The buildings are the same as in the first sample
# // input, but their direction is reversed.

require 'test/unit/assertions'
include Test::Unit::Assertions

# using running max height
def sunset_views1(buildings, direction)
  output = []
  max_height = 0
  buildings.reverse! if direction == 'EAST'
  size = buildings.length - 1
  buildings.each_with_index do |height, index|
    if height > max_height
      idx = direction == 'EAST' ? size - index : index
      output << idx
    end
    max_height = [max_height, height].max
  end
  if direction == 'EAST'
    output.reverse
  else
    output
  end
end

# using running max height
def sunset_views2(buildings, direction)
  output = []
  is_east = direction == 'EAST'
  step = is_east ? -1 : 1
  idx = is_east ? (buildings.length - 1) : 0
  running_height = 0
  while idx >= 0 && idx < buildings.length
    building_height = buildings[idx]
    output << idx if running_height < building_height
    running_height = [running_height, building_height].max
    idx += step
  end
  is_east ? output.reverse : output
end

# using stack

def sunset_views(buildings, direction)
  stack = []
  is_east = direction == 'EAST'
  idx = is_east ?  0 : (buildings.length - 1)
  step = is_east ? 1 : -1
  while idx >= 0 && idx < buildings.length
    building_height = buildings[idx]
    stack.pop while stack.any? && buildings[stack.last] <= building_height
    stack.push idx
    idx += step
  end
  is_east ? stack : stack.reverse
end

# 0, 1
puts sunset_views([3, 5, 4, 4, 3, 1, 3, 2], 'WEST').to_s
assert_equal sunset_views([3, 5, 4, 4, 3, 1, 3, 2], 'WEST'), [0, 1], 'passed'

# 1,3,6,7
puts sunset_views([3, 5, 4, 4, 3, 1, 3, 2], 'EAST').to_s
assert_equal sunset_views([3, 5, 4, 4, 3, 1, 3, 2], 'EAST'), [1, 3, 6, 7]
