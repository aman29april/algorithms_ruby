def selection_sort(arr)
  return arr if arr.length <= 1

  (0..arr.length - 2).each do |current_id|
    smallest_id = current_id
    Range.new(current_id + 1, arr.length - 1).each do |i|
      smallest_id = i if arr[i] < arr[smallest_id]
    end
    arr[current_id], arr[smallest_id] = arr[smallest_id], arr[current_id]
  end
  arr
end

puts selection_sort([9, 30, 2, 88, 3, 98, 45]).to_s
