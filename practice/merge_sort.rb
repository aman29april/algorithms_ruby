def merge_sort(ar)
  return ar if ar.size <=1

  mid = ar.size / 2
  left_half = merge_sort(ar[0, mid])
  right_half = merge_sort(ar[mid, ar.size])

  merge(left_half, right_half)
end

def merge(left, right)
  return right if left.empty?
  return left if right.empty?

  i = 0
  j = 0
  result = []
  while(i <left.size && j < right.size)
    if left[i] <= right[j]
      result << left[i]
      i += 1
    else
      result << right[j]
      j +=1
    end
  end

  while(i <left.size)
    result << left[i]
    i += 1
  end


  while(j <right.size)
    result << right[j]
    j += 1
  end

  result

end

puts merge_sort([9, 30, 2, 88, 3, 98, 45]).to_s
