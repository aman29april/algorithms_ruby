def heap_sort(arr)
  return arr if arr.length < 2

  build_heap(arr)

  (arr.length - 1).downto(1).each do |i|
    # largest node is shifted to end
    swap(arr, 0, i)
    heapify(arr, 0, i)
  end
  arr
end

def build_heap(arr)
  length = arr.length
  start = length / 2 - 1
  start.downto(0).each do |i|
    heapify(arr, i, length - 1)
  end
end

def heapify(arr, i, limit)
  left = 2 * i + 1
  right = left + 1

  new_index = i

  new_index = left if left < limit && arr[left] > arr[new_index]
  new_index = right if right < limit && arr[right] > arr[new_index]
  return if i == new_index

  swap(arr, i, new_index)
  heapify(arr, new_index, limit)
end

def swap(arr, i, j)
  arr[i], arr[j] = arr[j], arr[i]
end

puts heap_sort([8, 5, 2, 9, 5, 6, 3]).to_s
