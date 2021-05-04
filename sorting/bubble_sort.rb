def bubbleSort(ar)
  size = ar.length
  ar.each_with_index do |_item, index|
    (0...size - 1 - index).each do |ind|
      ar[ind], ar[ind + 1] = ar[ind + 1], ar[ind] if ar[ind + 1] < ar[ind]
    end
  end
  ar.to_s
end

def insertion_sort(ar)
  return ar.to_s if ar.length == 1

  (1...ar.length).each do |i|
    j = i
    while j > 0
      if ar[j] < ar[j - 1]
        ar[j - 1], ar[j] = ar[j], ar[j - 1]
      else
        break
      end
      j -= 1
    end
  end
  ar.to_s
end

def insertion_sort2(ar)
  return ar.to_s if ar.length == 1

  (1...ar.length).each do |i|
    tmp = ar[i]
    j = i
    while j > 0 && tmp < ar[j - 1]
      ar[j] = ar[j - 1]
      j -= 1
    end
    ar[j] = tmp
  end
  ar.to_s
end

puts insertion_sort2([9, 30, 2, 88, 3, 98, 45])
