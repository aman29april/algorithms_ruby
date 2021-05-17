# You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

# Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

# You may assume that you have an infinite number of each kind of coin.

def coin_change(coins, amount)
  return 0 if amount.zero?

  dp = Array.new(amount + 1, Float::INFINITY)

  # To make 0 denomination, 0 coins needed
  dp[0] = 0
  coins.each do |coin|
    # We cant make smaller amount with larger coin
    # Example if coin value is 5, min amt possible is also 5
    (coin..amount).each do |amt|
      # Minimum of current value and 1 + value at remaining balance index
      dp[amt] = [dp[amt], 1 + dp[amt - coin]].min
    end
  end

  dp[amount] == Float::INFINITY ? -1 : dp[amount]
end

puts coin_change([1, 2, 5], 11)
