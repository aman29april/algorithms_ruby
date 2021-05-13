# build max heap from array

def heapify_max(arr, index)
  return arr if arr.empty?

  largest = index
  left = (index * 2) + 1
  right = (index * 2) + 2

  # check if left exist, and value of left is greater then root
  largest = left if left < arr.length && arr[left] > arr[largest]
  largest = right if right < arr.length && arr[right] > arr[largest]

  # swap if largest is not root index
  if largest != index
    arr[largest], arr[index] = arr[index], arr[largest]

    # Recursively heapify the affected sub-tree
    heapify_max(arr, largest)
  end
end

def heapify_min(arr, index)
  smallest = index
  left = 2 * index + 1
  right = 2 * index + 2
  length = arr.length

  smallest = left if left < length && arr[left] < arr[smallest]
  smallest = right if right < length && arr[right] < arr[smallest]

  if smallest != index
    arr[smallest], arr[index] = arr[index], arr[smallest]
    heapify_min(arr, smallest)
  end
end

def build_heap(arr)
  return arr if arr.empty?

  # Find 1st non leaf
  length = arr.length
  start_index = length / 2 - 1
  start_index.downto(0).each do |i|
    heapify_max(arr, i)
  end
end

arr = [1, 3, 5, 4, 6, 13,
       10, 9, 8, 15, 17]
build_heap(arr)

puts arr.to_s
