def bubble_sort(ar)
  size = ar.length
  ar.each_with_index do |_item, index|
    (0...size - 1 - index).each do |ind|
      ar[ind], ar[ind + 1] = ar[ind + 1], ar[ind] if ar[ind + 1] < ar[ind]
    end
  end
  ar.to_s
end

# METHOD 2, optimized
def bubble_sort(ar)
  return ar if ar.size <= 1

  swapped = true
  while swapped
    swapped = false
    (ar.length - 1).times do |i|
      if ar[i] > ar[i + 1]
        ar[i], ar[i + 1] = ar[i + 1], ar[i]
        swapped = true
      end
    end
  end
  ar
end
puts bubble_sort([9, 30, 2, 88, 3, 98, 45])
