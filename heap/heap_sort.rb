def heapify_max(arr, index, limit)
  left = index * 2 + 1
  right = index * 2 + 2
  largest = index

  largest = left if left < limit && arr[left] > arr[largest]
  largest = right if right < limit && arr[right] > arr[largest]

  return if largest == index

  arr[largest], arr[index] = arr[index], arr[largest]
  heapify_max(arr, largest, limit)
end

def build_heap(arr)
  length = arr.length
  start = length / 2 - 1
  start.downto(0).each do |i|
    heapify_max(arr, i, length)
  end
end

def heap_sort(arr)
  return arr if arr.empty?

  build_heap(arr)
  puts arr.to_s
  heap_length = arr.length
  while heap_length >= 1
    # Largest element will be at heap_length -1
    arr[heap_length - 1], arr[0] = arr[0], arr[heap_length - 1]
    heapify_max(arr, 0, heap_length - 1)
    heap_length -= 1
  end
end

ar = [12, 11, 13, 5, 6, 7]
heap_sort(ar)
puts ar.to_s
