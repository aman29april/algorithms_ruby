
def is_palindrome?(str)
	ar = str.split('')
	i, j = 0, ar.length-1
	while i < j
		return false if ar[i] != ar[j]
		i , j = i +1, j -1 
	end
	return true
end

def is_palindrom_recursion?(ar)
	return true if ar.length <= 1
	i, j = 0, ar.length-1
	return ar[i] == ar[j] if ar == 2
	if ar[i] == ar[j]
		return is_palindrom_recursion?(ar[i+1, j-1])
	else
		return false
	end

end


# puts is_palindrome?("abbccbba")


puts is_palindrom_recursion?("abbccbba".split(''))


puts is_palindrom_recursion?("aman".split(''))

puts is_palindrom_recursion?("kak".split(''))

puts is_palindrom_recursion?("pp".split(''))

puts is_palindrom_recursion?("a".split(''))

puts is_palindrom_recursion?("aaa9aaa".split(''))
