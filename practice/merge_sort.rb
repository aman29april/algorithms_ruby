def merge_sort(ar)
  return ar if ar.length <= 1

  length = ar.length
  mid = length / 2

  left_ar = merge_sort(ar[0, mid])
  right_ar = merge_sort(ar[mid, length])
  merge(left_ar, right_ar)
end

def merge(ar1, ar2)
  i = 0
  j = 0
  new_ar = []
  while i < ar1.length && j < ar2.length
    if ar1[i] <= ar2[j]
      new_ar << ar1[i]
      i += 1
    else
      new_ar << ar2[j]
      j += 1
    end
  end

  while i < ar1.length
    new_ar << ar1[i]
    i += 1
  end

  while j < ar2.length
    new_ar << ar2[j]
    j += 1
  end
  puts ar2.to_s
  new_ar
end
puts merge_sort([9, 30, 2, 88, 3, 98, 45]).to_s
