# Given a string, find its first non-repeating character
# Given a string, find the first non-repeating character in it.
# For example, if the input string is “GeeksforGeeks”, then the output should be ‘f’ and if the input string is “GeeksQuiz”, then the output should be ‘G’.

def first_non_repeating(str)
  ar = Array.new(256, 0)
  str.each_char { |c| ar[c.ord] += 1 }
  str.each_char do |c|
    return c if ar[c.ord] == 1
  end
  nil
end

def first_non_repeating_optimized(str)
  ar = Array.new(256) { [0, -1] }
  str.split('').each_with_index do |c, index|
    ar[c.ord][0] += 1
    ar[c.ord][1] = index if ar[c.ord][1] == -1
  end
  ar[0][1] = -11

  first = nil
  min_index = str.length
  ar.each_with_index do |arr, index|
    if arr[0] == 1 && arr[1] < min_index
      first = index.chr
      min_index = [min_index, arr[1]].min
    end
  end
  first
end

# INT_MAX = (8*8)**2
def first_non_repeating_optimized2(str)
  ar = Array.new(256) { -1 }
  str.split('').each_with_index do |c, index|
    ar[c.ord] = if ar[c.ord] == -1
                  index
                else
                  -2
                end
  end

  first = str.length
  ar.each do |e|
    first = [first, e].min if e >= 0
  end
  str[first]
end

puts first_non_repeating_optimized('GeeksforGeeks')
puts first_non_repeating_optimized('Geeks')
puts first_non_repeating_optimized('aman')
