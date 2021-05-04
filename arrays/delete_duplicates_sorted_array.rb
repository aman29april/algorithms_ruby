# delete dublicate sorted array


def delete_duplicate(ar)
	k = 1
	for i in 1..ar.length
		if(ar[i] != ar[i-1])
			ar[k] = ar[i]
			k = k + 1
		end
	end
	ar[0...k-1]
end


puts delete_duplicate([1,1,2,3,4,4,5,5,5]).to_s
puts delete_duplicate([1,2,3,4,4,4,5,5,5]).to_s