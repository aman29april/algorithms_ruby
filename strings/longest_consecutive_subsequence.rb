# Longest Consecutive Subsequence
# Given an array of integers, find the length of the longest sub-sequence such that elements in the subsequence are consecutive integers, the consecutive numbers can be in any order.

# Examples:

# Input: arr[] = {1, 9, 3, 10, 4, 20, 2}
# Output: 4
# Explanation:
# The subsequence 1, 3, 4, 2 is the longest
# subsequence of consecutive elements

# using insertion sort
def sort(ar)
  return ar if ar.length <= 1

  (1..ar.length - 1).each do |i|
    j = i - 1
    next unless ar[i] < ar[j]

    tmp = ar[i]

    while j >= 0 && tmp < ar[j]
      ar[j + 1] = ar[j]
      j -= 1
    end
    ar[j + 1] = tmp
  end
  ar
end

def remove_duplicates(ar)
  p = 1
  (1..ar.length).each do |i|
    if ar[i] != ar[i - 1]
      ar[p] = ar[i]
      p += 1
    end
  end
  ar[0, p - 1]
end

def longest_seq_naive(ar)
  max_till_now = 1
  current_max = 1
  sorted_ar = remove_duplicates(sort(ar))
  # puts (0..sorted_ar.length).to_a
  (0..sorted_ar.length - 1).each do |i|
    if sorted_ar[i] + 1 == sorted_ar[i + 1]
      current_max += 1
    else
      max_till_now = current_max if current_max > max_till_now
      current_max = 1
    end
  end
  max_till_now
end

def longest_seq_using_hash(ar)
  ar_hash = {}
  ans = 1
  ar.each do |e|
    ar_hash[e] = true
  end

  ar.each do |e|
    next unless ar_hash[e - 1].nil?

    j = e
    j += 1 while ar_hash[j + 1]
    ans = [ans, j - e + 1].max
  end
  ans
end

# TODO- using priority queue

ar = [1, 1, 9, 3, 10, 4, 20, 2]

puts longest_seq_using_hash(ar).to_s
