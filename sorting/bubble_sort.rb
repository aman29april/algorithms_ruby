def bubble_sort(ar)
  size = ar.length
  ar.each_with_index do |_item, index|
    (0...size - 1 - index).each do |ind|
      ar[ind], ar[ind + 1] = ar[ind + 1], ar[ind] if ar[ind + 1] < ar[ind]
    end
  end
  ar.to_s
end

puts bubble_sort([9, 30, 2, 88, 3, 98, 45])
