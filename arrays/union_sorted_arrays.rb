# Given two sorted arrays, find their union and intersection.

def union(ar1, ar2)
	i = 0
	j = 0
	l = ar1.length
	m = ar2.length
	common = []
	while(i<l && j<m)
		if(ar1[i] == ar2[j])
			common << ar1[i]
			i = i + 1
			j = j + 1

		elsif(ar1[i] > ar2[j])
			common << ar2[j]
			j = j +1
		else
			common << ar1[i]
			i = i +1
		end

	end

	while(i<l)
		common << ar1[i]
		i = i +1
	end

	while(j<m)
		common << ar2[j]
		j = j +1
	end
	common
end


def union_if_duplicates_prsent(ar1, ar2)
	i = 0
	j = 0
	l = ar1.length
	m = ar2.length
	common = []
	while(i<l && j<m)
		if(ar1[i] == ar2[j])
			common << ar1[i]
			i = i + 1
			j = j + 1

		elsif(ar1[i] > ar2[j])
			common << ar2[j]
			j = j +1
		else
			common << ar1[i]
			i = i +1
		end

	end

	while(i<l)
		common << ar1[i]
		i = i +1
	end

	while(j<m)
		common << ar2[j]
		j = j +1
	end
	common
end

def intersection(ar1, ar2)
	i = 0
	j = 0
	common = []
	while i < ar1.length
		if(ar1[i]== ar2[j])
			common << ar1[i]
			i = i + 1
			j = j + 1
		end
		while(ar1[i] > ar2[j] && j < ar2.length-1)
			j = j + 1
		end
		while(ar2[j] > ar1[i] && i < ar1.length-1)
			i = i + 1
		end

		if(i == ar1.length-1 || j == ar2.length-1)
			break
		end
	end
	common
end

arr1 = [1, 2, 4, 5, 6] 
arr2 = [2, 3, 5, 7] 

puts union(arr1, arr2).to_s



