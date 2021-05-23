# You are given an array prices where prices[i] is the price of a given stock on the ith day + 1 (so that we consider the 0th index day one).
# You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
# Return the maximum profit you can achieve from this transaction.
# If you cannot achieve any profit, return 0.

# Example 1:
# Input: prices = [7,1,5,3,6,4]
# Output: 5
# Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5
# Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

# Example 2:
# Input: prices = [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transactions are done and the max profit = 0

# Example 3:
# Input: prices = [7,9,15,1,6,5]
# Output: 8
# Explaination: The greatest different in price occurs between 7 and 15, creating the greatest amount of profit. It is not always the lowest amount.


def max_profit1(prices)
    profit = 0
    (0..prices.length-2).each do |i|
      (i..prices.length-1).each do |j|
        if prices[j] - prices[i] > profit
          profit = prices[j] - prices[i]
      end
    end
  end
  profit
end


def max_profit(prices)
  lowest_price = prices[0]
  profit = 0
  (1..prices.length-1).each do |i|
    curr_profit = prices[i] - lowest_price
    if curr_profit > profit
      profit = curr_profit
    end

    lowest_price = prices[i] if prices[i] < lowest_price
  end

  profit
end

puts max_profit([7,1,5,3,6,4])

puts max_profit([[7,6,4,3,1]])

puts max_profit([7,9,15,1,6,5])
