# Subsequences of a string

def subsequences(str)
  seq = []
  ar = str.split('')
  i = 0
  while i < ar.length
    seq.push(str[i])
    ((i + 1)..ar.length - 1).each do |j|
      seq.push(ar[i] + ar[j, ar.length - 1].join(''))
      j + -1
    end
    i += 1
  end
  seq
end

puts subsequences('abc')
