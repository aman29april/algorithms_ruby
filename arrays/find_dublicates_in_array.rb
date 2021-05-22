# Find duplicates in a given array when elements are not limited to a range

def findDuplicates(ar)
  duplicates = []
  ar_hash = {}
  size = ar.length
  ar.each_with_index do |val, index|
    [index + 1..size].each do |_ind|
      ar_hash[val] = ar_hash[val].to_i + 1 if ar[index] == val
    end
  end
  ar_hash.each do |k, v|
    duplicates.push k if v > 1
  end
  duplicates.to_s
end

def findDuplicatesWithHash(ar)
  duplicates = []
  ar_hash = {}
  size = ar.length
  ar.each_with_index do |val, _index|
    ar_hash[val] = ar_hash[val].to_i + 1
  end
  ar_hash.each do |k, v|
    duplicates.push k if v > 1
  end
  duplicates.to_s
end

puts findDuplicatesWithHash([2, 10, 10, 100, 2, 10, 11, 2, 11, 2])
