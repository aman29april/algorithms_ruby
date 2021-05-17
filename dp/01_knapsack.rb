def knapsack_rec(weights, values, capacity, length)
  return 0 if length.zero? || capacity.zero?

  # if weight is more than the capacity, so can't be included
  return knapsack_rec(weights, values, capacity, length - 1) if weights[length - 1] > capacity

  remaining_cap = capacity - weights[length - 1]

  # Max of if we include the item or don't include
  # If we include, we will add value also
  [
    values[length - 1] + knapsack_rec(weights, values, remaining_cap, length - 1),
    knapsack_rec(weights, values, capacity, length - 1)
  ].max
end

def knapsack_dp(weights, values, capacity)
  return 0 if weights.empty? || capacity.zero?

  length = weights.length
  dp = Array.new(length + 1) { |_i| Array.new(capacity + 1, 0) }

  (1..length).each do |item|
    weight = weights[item - 1]
    value = values[item - 1]
    (1..capacity).each do |cap|
      dp[item][cap] = if weight > cap
                        dp[item - 1][cap]
                      else
                        [dp[item - 1][cap], dp[item - 1][cap - weight] + value].max
                      end
    end
  end
  # puts dp.to_s
  dp[-1][-1]
end
values = [60, 100, 120]
weights = [10, 20, 30]
capacity = 50

# puts knapsack_rec(weights, values, capacity, weights.length) #output 220

puts knapsack_dp(weights, values, capacity) # output 220

puts knapsack_dp(weights, values, capacity) # output 220

weights = [[1, 2, 3, 4, 5],  [1, 3, 4, 6, 9],  [1, 2, 3, 5],     [3, 5]]
values  = [[3, 5, 4, 8, 10], [5, 10, 4, 6, 8], [1, 19, 80, 100], [80, 100]]
capacities = [5, 10, 6, 2]

(0..3).each do |i|
  puts "[DP] 0-1 Knapsack max value : #{knapsack_dp(weights[i], values[i], capacities[i])}"
  puts "[Recursive] 0-1 Knapsack max value : #{knapsack_rec(weights[i], values[i], capacities[i], weights[i].length)}"
end
