# How to find all pairs on integer array whose sum is equal to given number?

def findPairBrutforce(ar, sum)
  pairs = []
  length = ar.length
  ar.each_with_index do |n1, index|
    n2 = sum - n1
    ar[index + 1..length].each do |e2|
      if n2 == e2
        pairs << [n1, n2]
        break
      end
    end
  end
  pairs.to_s
end

def findPairUsingHash(ar, sum)
  pairs = []
  ar_hash = {}
  # ar.each{|e| ar_hash[e] = true}

  ar.each do |e|
    ar_hash[e] = ar_hash[e].to_i + 1
    pairs << [e, sum - e] if ar_hash[sum - e] != nil
  end

  pairs.to_s
end

ar = [0, 14, 0, 4, 7, 8, 3, 5, 7]
sum = 11
# puts findPairBrutforce(ar, sum)
# puts findPairBrutforce([2, 4, 3, 5, 6, -2, 4, 7, 8, 9], 7)

puts findPairUsingHash(ar, sum)
puts findPairUsingHash([2, 4, 3, 5, 6, -2, 4, 7, 8, 9], 7)
puts findPairUsingHash([1, 5, 7, -1, 5], 6)
