# https://leetcode.com/problems/candy/
# There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.

# You are giving candies to these children subjected to the following requirements:

# Each child must have at least one candy.
# Children with a higher rating get more candies than their neighbors.
# Return the minimum number of candies you need to have to distribute the candies to the children.

# Example 1:

# Input: ratings = [1,0,2]
# Output: 5
# Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.

# Method 1, o(n2)
# Time Limit Exceeded in Leetcode
def candy_1(ratings)
  rewards = Array.new(ratings.length, 1)
  (1..ratings.length - 1).each do |i|
    j = i - 1
    # increment rewards if ratings are increasing
    if ratings[i] > ratings[j]
      rewards[i] = 1 + rewards[j]
    else
      # Go back till ratings are increasing
      while (j >= 0) && (ratings[j] > ratings[j + 1])
        # max out of current value and 1+ previous value (we are going back)
        rewards[j] = [rewards[j], rewards[j + 1] + 1].max
        j -= 1
      end
    end
  end
  rewards.sum
end

# Method 2, Using local mins and max
# this solution works for unique values of ratings
def candy_2(ratings)
  rewards = Array.new(ratings.length, 1)
  local_mins(ratings).each do |min|
    expand_from_local_min(min, ratings, rewards)
  end
  # puts rewards.to_s
  rewards.sum
end

# expand rewards values from local min index
def expand_from_local_min(i, ratings, rewards)
  rewards[i] = 1
  left = i - 1
  while left >= 0 && ratings[left] > ratings[left + 1]
    rewards[left] = [rewards[left], rewards[left + 1] + 1].max
    left -= 1
  end

  right = i + 1
  while right < ratings.length && ratings[right] > ratings[right - 1]
    #  instead of rewards[right] = [rewards[right], rewards[right - 1] + 1].max
    #  we can directly increment rewards from previous value
    #  Expansion to right is 1st time we are asining rewards
    #  problem comes when we expand left wards
    #  In that case we need to have a max check so that we may not overwrite values
    #  that are already assigned
    rewards[right] = rewards[right - 1] + 1
    right += 1
  end
end

# return indices of local mins
def local_mins(array)
  length = array.length
  return [0] if length == 1

  mins = []

  # For rest of elments
  (0..length - 1).each do |i|
    if i.zero? && array[i] <= array[i + 1]
      mins << i
    elsif i == length - 1 && array[i] < array[i - 1]
      mins << i
    elsif i + 1 < length && array[i] <= array[i - 1] && array[i] < array[i + 1]
      mins << i
    end
  end
  mins
end

# Method 3
# Easiest and effective solution
# works for repeating values as well
def candy(ratings)
  length = ratings.length
  rewards = Array.new(length, 1)
  (1..length - 1).each do |i|
    rewards[i] = rewards[i - 1] + 1 if ratings[i] > ratings[i - 1]
  end

  (length - 2).downto(0).each do |j|
    if ratings[j] > ratings[j + 1]
      rewards[j] = [rewards[j + 1] + 1, rewards[j]].max
    end
  end

  rewards.sum
end

puts candy([1, 0, 2]) # 5
puts candy([8, 4, 2, 1, 3, 6, 7, 9, 5]) # 25
puts candy([1, 2, 3, 5, 4, 3, 2, 1, 4, 3, 2, 1, 3, 2, 1, 1, 2, 3, 4]) # 47

puts candy([1, 2]) # 3
puts candy([1, 2, 2]) # 4

puts candy([1, 3, 2, 2, 1]) # 7
puts candy([29, 51, 87, 87, 72, 12]) # => 12
