require_relative './heap'

Pair = Struct.new(:list_index, :data_index, :value)

def merge_k_sorted_arrays(arr)
  output = []
  pairs = []

  # 1st element of each array
  arr.each_with_index do |ar, i|
    pair = Pair.new(i, 0, ar[0])
    pairs << pair
  end

  # heap of all 1st elements and pass comparator as block
  heap = Heap.new(pairs, HeapType::MIN) do |p1, p2|
    p1.value < p2.value
  end

  while heap.any?
    pair = heap.poll
    output << pair.value
    pair.data_index += 1

    # check if we have reached end of array to which pair belongs
    # try to insert next element of array to which pair belongs into heap
    if pair.data_index < arr[pair.list_index].length
      pair.value = arr[pair.list_index][pair.data_index]
      heap.add pair
    end

  end
  output
end

ar = [[1, 4, 5], [1, 3, 4], [2, 6]]
puts merge_k_sorted_arrays(ar).to_s

ar = [[1, 2, 3],
      [2, 4, 6],
      [0, 9, 10]]

puts merge_k_sorted_arrays(ar).to_s
