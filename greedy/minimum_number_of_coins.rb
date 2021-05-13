# Given a value V, if we want to make a change for V Rs, and we have an infinite supply of each of the denominations in Indian currency,
# i.e., we have an infinite supply of { 1, 2, 5, 10, 20, 50, 100, 500, 1000} valued coins/notes,
# what is the minimum number of coins and/or notes needed to make the change?

# Input: V = 70
# Output: 2
# We need a 50 Rs note and a 20 Rs note.
#
# Input: V = 121
# Output: 3
# We need a 100 Rs note, a 20 Rs note and a 1 Rs coin.

def coin_change(coins, amount)
  return 0 if amount.zero?

  output = 0
  remaining = amount
  coins.sort! { |a, b| b <=> a }
  coins.each do |coin|
    num = remaining / coin
    next if num.zero?

    remaining -= (coin * num)
    output += num
    return output if remaining.zero?
  end
  -1
end

# coins = [1, 2, 5]
deno = [1, 2, 5, 10, 20, 50,
        100, 500, 1000]
amount = 11

puts coin_change(deno, amount)
