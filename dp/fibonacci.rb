def fibonacci_recursive(num)
  return num if num < 2

  fibonacci_recursive(num - 1) + fibonacci_recursive(num - 2)
end

def fibonacci_with_memoization(num, dp = [])
  return num if num < 2
  return dp[num] if dp[num]

  dp[num] = fibonacci_with_memoization(num - 1) + fibonacci_with_memoization(num - 2)
end

def fibonacci_tabular(num)
  dp = [0, 1]
  (2..num).each do |i|
    dp[i] = dp[i - 1] + dp[i - 2]
  end
  dp[num]
end

puts 'Fibonacci with recursive solution'
puts fibonacci_recursive(7)
# puts fibonacci_recursive(20)

puts 'Fibonacci with DP - Memoization'
puts fibonacci_with_memoization(5)
puts fibonacci_with_memoization(6)
puts fibonacci_with_memoization(7)
puts fibonacci_with_memoization(20)

puts 'Fibonacci with DP - Tabular'
puts fibonacci_tabular(5)
puts fibonacci_tabular(6)
puts fibonacci_tabular(7)
puts fibonacci_tabular(20)
