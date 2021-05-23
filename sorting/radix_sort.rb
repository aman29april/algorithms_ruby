def radix_sort(arr)
  return arr if arr.length <= 1

  max = arr.max
  exponent = 1
  while exponent <= max
    counting_sort(arr, exponent)
    exponent *= 10
  end
  arr
end

def counting_sort(arr, exp)
  count = Array.new(10, 0)
  ans = Array.new(arr.length)
  0.upto(arr.length - 1).each do |i|
    val = arr[i] / exp % 10
    count[val] += 1
  end

  1.upto(count.length - 1).each do |i|
    count[i] += count[i - 1]
  end
  (arr.length - 1).downto(0).each do |i|
    val = arr[i] / exp % 10
    pos = count[val] - 1
    ans[pos] = arr[i]
    count[val] -= 1
  end
  0.upto(arr.length - 1).each { |i| arr[i] = ans[i] }
end

puts radix_sort([573, 25, 415, 12, 161, 6]).to_s
