# elements smaller than pivot should come before and greater shouuld come after the pivot

def partioning(arr, pivot)
  i = 0
  j = 0
  while i < arr.length
    if arr[i] > pivot
      i += 1
    else
      arr[i], arr[j] = arr[j], arr[i]
      j += 1
      i += 1
    end
  end

  arr
end

puts partioning([7, -2, 4, 1, 3], 3).to_s
