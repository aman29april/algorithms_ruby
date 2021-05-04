# Find duplicates in a given array when elements are not limited to a range


def findDuplicates(ar)
	dublicates = []
	ar_hash = {}
	size = ar.length
	ar.each_with_index do |val, index|

		[index+1..size].each do |ind|
			if(ar[index] == val)
				ar_hash[val] = ar_hash[val].to_i + 1
			end
		end
	end
	ar_hash.each do |k, v|
		if v > 1
			dublicates.push k
		end
	end
	dublicates.to_s
end


def findDuplicatesWithHash(ar)
	dublicates = []
	ar_hash = {}
	size = ar.length
	ar.each_with_index do |val, index|
		ar_hash[val] = ar_hash[val].to_i + 1
	end
	ar_hash.each do |k, v|
		if v > 1
			dublicates.push k
		end
	end
	dublicates.to_s
end



puts findDuplicatesWithHash([2, 10,10, 100, 2, 10, 11,2,11,2])
