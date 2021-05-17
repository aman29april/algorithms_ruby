# You are given an integer array of coins representing coins of different denominations and an integer amount representing a total amount of money.
# Return the number of combinations that make up that amount. If that amount of money cannot be made up by any combination of the coins, return 0.
# You may assume that you have an infinite number of each kind of coin.
# Input: amount = 5, coins = [1,2,5]
# Output: 4
# Explanation: there are 4 ways
# 5=5
# 5=2+2+1
# 5=2+1+1+1
# 5=1+1+1+1+1

# Input: amount = 3, coins = [2]
# Output: 0
# Explanation: the amount of 3 cannot be made up just with coins of 2.
#

def change(amount, coins)
  return 0 if coins.empty?

  # TO make zero, there is one way. Dont give anything.
  ways = Array.new(amount + 1, 0)
  ways[0] = 1
  coins.each do |coin|
    (coin..amount).each do |amt|
      ways[amt] += ways[amt - coin]
    end
  end
  ways[-1]
end

puts change(5, [1, 2, 5])
