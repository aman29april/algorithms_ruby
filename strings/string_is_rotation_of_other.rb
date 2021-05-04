# Given a string s1 and a string s2, write a snippet to say whether s2 is a rotation of s1?
# (eg given s1 = ABCD and s2 = CDAB, return true, given s1 = ABCD, and s2 = ACBD , return false)
# https://www.geeksforgeeks.org/a-program-to-check-if-strings-are-rotations-of-each-other/

def is_rotated?(str1, str2)
  str = str1 + str1
  is_substring?(str, str2)
end

def is_substring?(str, substr)
  return false if str.length < substr.length

  i = 0
  length = str.length
  while i < length && (i + substr.length) < length
    j = 0
    j += 1 while str[i + j] == substr[j]
    return true if j == substr.length

    i += 1
  end
  false
end

str1 = 'ABCD'
str2 = 'CDAB'

puts is_rotated?(str1, str2)
