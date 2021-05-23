# This solution works fir there are no duplicates in the input
def four_sum(nums, target)
  return [] if nums.length < 4

  hash = {}
  output = []
  Range.new(1, nums.length - 2).each do |i|
    Range.new(i + 1, nums.length - 1).each do |j|
      sum = nums[i] + nums[j]
      diff = target - sum
      next unless hash.key? diff

      hash[diff].each do |pair|
        output << [*pair, nums[i], nums[j]]
      end
    end

    # We are adding pairs when we have visited 2nd number of pair to avoid duplicates
    (0..i).each do |k|
      pair = [nums[i], nums[k]]
      sum = pair.sum
      if hash.key? sum
        hash[sum].append pair
      else
        hash[sum] = [pair]
      end
    end
  end
  output
end

puts four_sum([1, 0, -1, 0, -2, 2], 0).to_s

puts four_sum([2, 2, 2, 2, 2], 8).to_s
