module HeapType
  MIN = 0
  MAX = 1
end

class Heap
  attr_reader :type

  def initialize(nums = [], type = HeapType::MAX, &compatrator)
    @items = nums
    @type = type
    set_comparator(&compatrator)
    build_heap(@items) if nums.any?
  end

  def clear
    @items = []
  end

  def add(element)
    @items << element
    rebalance_up(size - 1)
  end

  alias << add

  def peek
    @items[0]
  end

  def empty?
    size == 0
  end

  def any?
    !empty?
  end

  def is_max_heap?
    @type == HeapType::MAX
  end

  def is_min_heap?
    @type == HeapType::MIN
  end

  def print
    puts @items.to_s
  end

  # remove root node
  def poll
    return raise 'Heap Empty' if @items.length == 0

    item = @items[0]
    @items[0] = @items[-1]
    @items.pop
    heapify_down
    item
  end

  def size
    @items.count
  end

  private

  def heapify_down
    heapify(@items, 0)
  end

  def is_leaf?(i)
    !has_left?(i) && !has_right?(i)
  end

  def has_left?(i)
    left(i) < size
  end

  def has_right?(i)
    right(i) < size
  end

  def swap(i, j)
    @items[i], @items[j] = @items[j], @items[i]
  end

  def first_non_leaf_index
    size / 2 - 1
  end

  def left(i)
    2 * i + 1
  end

  def right(i)
    2 * i + 2
  end

  def parent(i)
    ((i - 1) / 2).floor
  end

  def has_parent?(i)
    i >= 1
  end

  def set_comparator(&comparator)
    @compare = if block_given?
                 comparator
               elsif is_min_heap?
                 ->(a, b) { a < b }
               else
                 ->(a, b) { a > b }
               end
  end

  def compare(a, b)
    @compare.call(a, b)
  end

  def heapify(nums = @items, index)
    length = nums.length
    left = left(index)
    right = right(index)
    new_index = index

    # if max heap, left or right will be greater than new_index
    compatrator = is_max_heap? ? :> : :<

    # equivalent to has_left?(index) && nums[left] >  nums[new_index] in case of max heap
    new_index = left if has_left?(index) && compare(nums[left], nums[new_index])
    new_index = right if has_right?(index) && compare(nums[right], nums[new_index])

    return if new_index == index

    swap(new_index, index)
    heapify(nums, new_index)
  end

  def rebalance_up(index)
    parent_index = parent(index)
    # puts [index, parent_index].to_s
    if has_parent?(index) && compare(@items[index], @items[parent_index])
      swap(index, parent_index)
      # puts parent_index
      rebalance_up(parent_index)
    end
  end

  def build_heap(nums)
    length = nums.length
    start = first_non_leaf_index
    start.downto(0).each do |i|
      heapify(nums, i)
    end
  end
end
