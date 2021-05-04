
def duplicates_in_str(str)
	common = {}
	ar = []

	# create an array, put occurance at index of integer representation of char 
	 str.each_char do |char|
		ar[char.ord] = ar[char.ord].to_i + 1
	end

	# if value is greater than 1, convert index to char
	for i in 0..ar.length
		common.push(i.chr) if(ar[i] != nil && ar[i]>1)
	end
	common.to_s
end


puts duplicates_in_str('java')
puts duplicates_in_str('raman')
puts duplicates_in_str('eradicate')