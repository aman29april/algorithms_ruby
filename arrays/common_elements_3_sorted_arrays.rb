# How to find common elements in three sorted array?

def find_common_elements(ar1, ar2, ar3)
  common = []
  l1 = ar1.length
  l2 = ar2.length
  l3 = ar3.length
  i = 0
  j = 0
  k = 0
  common = []
  while i < l1 && j < l2 && k < l3
    if ar1[i] == ar2[j] && ar2[j] == ar3[k]
      common.push ar1[i]
      i += 1
      j += 1
      k += 1
    elsif ar1[i] < ar2[j]
      i += 1
    elsif ar2[j] < ar3[k]
      j += 1
    else
      k += 1
    end
  end
  common
end

FIXNUM_MIN = -(2**(0.size * 8 - 2))

def find_common_with_duplicates(ar1, ar2, ar3)
  common = []
  l1 = ar1.length - 1
  l2 = ar2.length - 1
  l3 = ar3.length - 1
  i = 0
  j = 0
  k = 0
  prev1 = FIXNUM_MIN
  prev2 = FIXNUM_MIN
  prev3 = FIXNUM_MIN
  while i < l1 && j < l2 && k < l3
    i += 1 while ar1[i] == prev1 && i < l1
    j += 1 while ar2[j] == prev2 && j < l2
    k += 1 while ar3[k] == prev3 && k < l3

    puts [i, j, k].to_s

    if ar1[i] == ar2[j] && ar2[j] == ar3[k]
      common << ar1[i]
      prev1 = ar1[i]
      prev2 = ar1[i]
      prev3 = ar1[i]
      i += 1
      j += 1
      k += 1
    elsif ar1[i] < ar2[j]
      prev1 = ar1[i]
      i += 1
    elsif ar2[j] < ar3[k]
      prev2 = ar2[j]
      j += 1
    else
      prev3 = ar3[k]
      k += 1
    end
  end
  common
end
ar1 = [1, 5, 10, 20, 40, 80, 80, 80, 80]
ar2 = [6, 7, 20, 80, 80, 80, 100]
ar3 = [3, 4, 15, 20, 30, 70, 80, 120, 120, 120]

puts find_common_with_duplicates(ar1, ar2, ar3).to_s

# Load Stock pricing:
