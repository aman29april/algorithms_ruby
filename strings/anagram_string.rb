# Check whether two strings are anagram of each other


def merge_sort(ar)
	return ar if(ar.length == 1)
		

	mid = ar.length/2
	left, right = ar[0,mid], ar[mid,ar.length-1]
	first_half = merge_sort(left)
	second_half = merge_sort(right)
	ar = merge(first_half, second_half)
	return ar
end

def merge(ar1, ar2)
	sorted_array = []
	i,j = 0,0
	while(i < ar1.length && j < ar2.length)
		if(ar1[i]<=ar2[j])
			sorted_array << ar1[i]
			i +=1
		else
			sorted_array << ar2[j]
			j +=1
		end
	end

	while(i <ar1.length)
		sorted_array << ar1[i]
		i +=1
	end

	while(j <ar2.length)
		sorted_array << ar2[j]
		j +=1
	end
	sorted_array
end

# using 2 arrays
def is_anagram?(str1, str2)
	ar1 = Array.new(256, 0)
	ar2 = Array.new(256, 0)
	str1.each_char do |char|
		ar1[char.ord] += 1 
	end

	str2.each_char do |char|
		ar2[char.ord] += 1 
	end

	(0..255).each do |e|
		if(ar1[e] != ar2[e])
			return false
		end
	end
	return true
end

# using single array
def is_anagram2?(str1, str2)
	ar = Array.new(256, 0)
	str1.each_char do |char|
		ar[char.ord] += 1 
	end

	str2.each_char do |char|
		ar[char.ord] -= 1 
	end
	puts ar.to_s

	(0..255).each do |e|
		if(ar[e] != 0)
			return false
		end
	end
	return true
end


def is_anagram1?(str1, str2)
	return false if(str1.length != str2.length)

	merge_sort(str1.split('')) == merge_sort(str2.split(''))

end

# puts is_anagram?('test', 'ttew')
# puts is_anagram?('abcd', 'dabc')

puts is_anagram2?('test', 'ttew')
puts is_anagram2?('abcd', 'dabc')