def insertion_sort(ar)
  return ar if ar.size <= 1

  for i in 1...(ar.length)
    j = i
    tmp = ar[i]
    while(j > 0 && tmp < ar[j-1])
      ar[j] = ar[j-1]
      j-=1
    end
    ar[j] = tmp
  end
  ar
end

puts insertion_sort([9, 30, 2, 88, 3, 98, 45])
