# Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.

# You have the following three operations permitted on a word:

# Insert a character
# Delete a character
# Replace a character
# Input: word1 = "horse", word2 = "ros"
# Output: 3

# horse -> rorse (replace 'h' with 'r')
# rorse -> rose (remove 'r')
# rose -> ros (remove 'e')
# Let f(m, n) denote number of operations required to convert X(m) to Y(n) (X and Y are strings with m and n chars)

# f(m, n) = f(m - 1, n - 1) if X[m - 1] == Y[n - 1] # Last character is already equal, that reduces the problem
# else
# f(m, n) = 1 + min of the three operations:
#         = f(m - 1, n - 1) # Substituted last character of X with last character of Y
#         = f(m - 1, n)     # Deleted last character of X
#         = f(m, n - 1)     # Inserted last character of Y in end of X (now they have same last char)

# Base Cases:
# f(0, 0) = 0 # No operations required to convert empty string to empty string
# f(0, j) = j # It'll take j insertions to convert empty string to string of size j
# f(i, 0) = i # It'll take i deletions to convert string of i size to empty string

def min_distance(word1, word2)
  dp = Array.new(word1.size + 1) { Array.new(word2.size + 1) }

  # increment values in 1st row and col
  (0...dp.size).each do |i|
    dp[i][0] = i
  end
  (0...dp[0].size).each do |j|
    dp[0][j] = j
  end

  (1...dp.size).each do |i|
    (1...dp[0].size).each do |j|
      dp[i][j] = if word1[i - 1] == word2[j - 1]
                   # if chars are same, value will be from diagonal upward
                   dp[i - 1][j - 1]
                 else
                   [
                     dp[i - 1][j - 1],
                     dp[i][j - 1],
                     dp[i - 1][j]
                   ].min + 1
                 end
    end
  end
  dp[-1][-1]
end

puts min_distance('horse', 'ros')
puts min_distance('intention', 'execution')
