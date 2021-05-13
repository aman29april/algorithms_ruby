# Given weights and values of n items, we need to put these items in a knapsack of capacity W to get the maximum total value in the knapsack.

class Item
  attr_reader :weight, :value, :pos

  def initialize(wt, val, pos)
    @weight = wt
    @value = val
    @pos = pos
  end

  def val_to_wt
    @value / @weight
  end

  def to_s
    "wt: #{@weight}, val: #{@value}, val_to_wt: #{val_to_wt} pos: #{@pos}"
  end
end

def get_max(wt, val, capacity)
  items = []
  (0...wt.length).each do |i|
    items << Item.new(wt[i], val[i], i + 1)
  end
  # sort as per decreasing order of val_to_wt
  items.sort! { |a, b| b.val_to_wt <=> a.val_to_wt }
  curr_capacity = 0
  total_value = 0
  items.each do |item|
    if item.weight <= capacity - curr_capacity
      curr_capacity += item.weight
      total_value += item.value
    else
      # include fractional weight
      fraction = (capacity - curr_capacity) / item.weight.to_f
      total_value += (fraction * item.value).to_i
      curr_capacity += (fraction * item.weight)
      break
    end
  end
  total_value
end

wt = [10, 40, 20, 30]
val = [60, 40, 100, 120]
capacity = 50

puts get_max(wt, val, capacity)
