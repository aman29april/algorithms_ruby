# largest continous subarray

def largest_continous_subarray_brutforce(ar)
  largest_sum = 0
  (0...ar.length - 1).each do |i|
    sum = ar[i]
    (i + 1...ar.length).each do |j|
      sum += ar[j]

      largest_sum = sum if sum > largest_sum
    end
  end
  largest_sum
end

def largest_subarray_kadanes_algo(ar)
  max_so_far = 0
  max_ending_here = 0
  ar.each do |e|
    max_ending_here += e
    max_ending_here = 0 if max_ending_here < 0
    max_so_far = max_ending_here if max_ending_here > max_so_far
  end
  max_so_far
end

def largest_subarray_kadanes_print_index(ar)
  max_so_far = 0
  max_ending_here = 0
  start = 0
  ending = 0
  i = 0
  s = 0
  ar.each do |e|
    max_ending_here += e
    if max_ending_here < 0
      max_ending_here = 0
      s = i + 1
    end
    if max_ending_here > max_so_far
      max_so_far = max_ending_here
      ending = i
      start = s
    end
    i += 1
  end
  [start, ending]
end

ar = [-2, -3, 4, -1, -2, 1, 5, -3]

# puts largest_continous_subarray_brutforce(ar)

# puts largest_subarray_kadanes_algo(ar)

puts largest_subarray_kadanes_print_index(ar).to_a
