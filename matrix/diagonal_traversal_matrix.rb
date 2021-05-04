# Zigzag (or diagonal) traversal of Matrix
# Example:

# 1     2     3     4
# 5     6     7     8
# 9    10    11    12
# 13    14    15    16
# 17    18    19    20

# Diagonal printing of the above matrix is

# 1
# 5 2
# 9 6 3
# 13 10 7 4
# 17 14 11 8
# 18 15 12
# 19 16
# 20

def print_matrix(m)
  (0...m.length).each do |i|
    step = 0
    (0..i).each do |_j|
      print "#{m[i - step][step]} "
      step += 1
    end
    puts ''
  end
end

def print_diagonal(m)
  rows = m.length
  cols = m[0].length
  n = rows + cols - 1
  ar = Array.new(n) { |_i| [] }
  (0...rows).each do |r|
    (0...cols).each do |c|
      ar[r + c].append(m[r][c])
    end
  end
  (0...n).each do |i|
    puts ar[i].reverse.join(' ')
  end
end

m = [[1, 2, 3, 4],
     [5, 6, 7, 8],
     [9, 10, 11, 12],
     [13, 14, 15, 16],
     [17, 18, 19, 20]]

print_diagonal(m)
