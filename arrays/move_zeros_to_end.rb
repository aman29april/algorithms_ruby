# https://leetcode.com/problems/move-zeroes/solution/

# Leet code solution
def move_zeroes(nums)
  return nums if nums.empty?

  last_non_zero_at = 0
  nums.each_with_index do |num, _index|
    next unless num != 0

    nums[last_non_zero_at] = num
    last_non_zero_at += 1
  end
  (last_non_zero_at...nums.length).each { |i| nums[i] = 0 }
end
