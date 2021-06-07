# https://leetcode.com/problems/valid-parentheses/
# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
# An input string is valid if:
# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.

# Example1:
# Input: s = "()[]{}"
# Output: true

# Example 2:
# Input: s = "(]"
# Output: false

def is_valid(s)
  brackets = { '(' => ')', '{' => '}', '[' => ']' }
  stack = []
  s.each_char do |char|
    if brackets.key? char
      stack.push char
    elsif brackets.values.include? char
      test = stack.pop
      return false if test.nil? || brackets[test] != char
    end
  end
  stack.empty?
end

puts is_valid('()[]{}')

puts is_valid('(}')

puts is_valid('(})')

puts is_valid('(agwgg)([ghhheah%&@Q])')
