# https://leetcode.com/problems/find-all-anagrams-in-a-string/submissions/
# Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
# Example 1:
#
# Input: s = "cbaebabacd", p = "abc"
# Output: [0,6]
# Explanation:
# The substring with start index = 0 is "cba", which is an anagram of "abc".
# The substring with start index = 6 is "bac", which is an anagram of "abc".

def find_anagrams(s, p)
  window_len = p.length
  pmap = build_map(p)
  smap = build_map(s.slice(0, window_len))
  output = []
  i = window_len
  while i < s.length
    output << (i - window_len) if smap == pmap
    cha = s[i]
    chr = s[i - window_len]
    if smap.fetch(chr, 1) == 1
      smap.delete chr
    else
      smap[chr] -= 1
    end

    ch = s[i]
    smap[ch] = smap.fetch(ch, 0) + 1

    i += 1

  end

  output << (i - window_len) if smap == pmap

  output
end

def build_map(str)
  str.each_char.each_with_object({}) do |c, hash|
    hash[c] = hash.fetch(c, 0) + 1
  end
end
