def quick_sort(unsorted_array, from:, to:)
  return unsorted_array if from >= to

  if from < to && from >= 0 && to > 0
    pivot_index = partition2(unsorted_array, from, to)
    quick_sort(unsorted_array, from: from, to: pivot_index - 1)
    quick_sort(unsorted_array, from: pivot_index + 1, to: to)
  end
  unsorted_array
end

def partition_and_get_pivot_index(array, from_index, to_index)
  pivot_index = from_index
  pivot = array[pivot_index]
  pointer_a_index = from_index
  pointer_b_index = to_index
  while pointer_a_index < pointer_b_index

    pointer_a_index += 1 while array[pointer_a_index] <= pivot

    pointer_b_index -= 1 while array[pointer_b_index] >= pivot && pointer_b_index > 0
    swap(array, pointer_a_index, pointer_b_index) if pointer_a_index < pointer_b_index
  end

  swap(array, pivot_index, pointer_b_index)
  pointer_b_index
end

def partition2(ar, l, r)
  pivot = ar[r]
  i = l - 1
  (l..r - 1).each do |j|
    if ar[j] < pivot
      i += 1
      swap(ar, i, j)
    end
  end
  swap(ar, i + 1, r)
  i + 1
end

def swap(ar, i, j)
  ar[i], ar[j] = ar[j], ar[i]
end
ar = [9, 30, 2, 88, 3, 98, 45]
puts quick_sort(ar, from: 0, to: ar.length - 1).to_s
