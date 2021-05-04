# How to find the missing number in an integer array of 1 to 100?

def getMissingNo(ar)
  a = 0
  b = 0
  ar.each { |e| a = a ^ e }
  len = ar.length
  (0..len + 1).each { |e| b = b ^ e }
  a ^ b
end

ar = [1, 2, 3, 4, 6, 7, 9, 8, 10]
print getMissingNo(ar)
