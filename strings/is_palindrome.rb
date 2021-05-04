def is_palindrome?(str)
  ar = str.split('')
  i = 0
  j = ar.length - 1
  while i < j
    return false if ar[i] != ar[j]

    i += 1
    j -= 1
  end
  true
end

def is_palindrom_recursion?(ar)
  return true if ar.length <= 1

  i = 0
  j = ar.length - 1
  return ar[i] == ar[j] if ar == 2

  if ar[i] == ar[j]
    is_palindrom_recursion?(ar[i + 1, j - 1])
  else
    false
  end
end

# puts is_palindrome?("abbccbba")

puts is_palindrom_recursion?('abbccbba'.split(''))

puts is_palindrom_recursion?('aman'.split(''))

puts is_palindrom_recursion?('kak'.split(''))

puts is_palindrom_recursion?('pp'.split(''))

puts is_palindrom_recursion?('a'.split(''))

puts is_palindrom_recursion?('aaa9aaa'.split(''))
