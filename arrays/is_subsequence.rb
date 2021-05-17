# https://leetcode.com/problems/is-subsequence/
# Given two strings s and t, check if s is a subsequence of t.

# A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

# Example 1:

# Input: s = "abc", t = "ahbgdc"
# Output: true

def is_subsequence(s, t)
  t_id = 0
  s_id = 0
  while t_id < t.length && s_id < s.length
    s_id += 1 if t[t_id] == s[s_id]
    t_id += 1
  end
  s_id == s.length
end

# solution 2
def is_subsequence(s, t)
  s_index = 0
  t.each_char do |c|
    s_index += 1 if c == s[s_index]
    break if s_index == s.length
  end
  s_index == s.length
end
