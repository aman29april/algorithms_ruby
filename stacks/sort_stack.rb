# Write a function that takes in an array of integers representing a stack, recursively sorts the stack in place (i.e., doesn't create a brand new array), and returns it.
# The array must be treated as a stack, with the end of the array as the top of the stack. Therefore, you're only allowed to Pop, push and peek

# You're not allowed to perform any other operations on the input array, including accessing elements (except for the last element), moving elements, etc.. You're also not allowed to use any other data structures, and your solution must be recursive.

# Sample Input
# stack = [-5, 2, -2, 4, 3, 1]
# Sample Output
# [-5, -2, 1, 2, 3, 4]

def sort(stack)
  return stack if stack.empty?

  top = stack.pop
  sort(stack)
  insert_into_sorted_stack(stack, top)
  stack
end

def insert_into_sorted_stack(stack, value)
  if stack.empty? || stack[-1] <= value
    stack.push value
    return stack
  end

  top = stack.pop
  insert_into_sorted_stack(stack, value)

  stack.push top
end

# puts insert_into_sorted_stack([5, 20, 40, 80], 2).to_s

# [-5, -2, 1, 2, 3, 4]
puts sort([-5, 2, -2, 4, 3, 1]).to_s

# [-9, -2, 0, 1, 3, 4, 8]
puts sort([0, -2, 3, 4, 1, -9, 8]).to_s
