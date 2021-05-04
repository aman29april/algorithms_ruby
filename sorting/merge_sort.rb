def merge_sort(unsorted_array)
	if(unsorted_array.length <= 1)
		return unsorted_array
	end
	mid = unsorted_array.length/2
	first_half = merge_sort(unsorted_array[0,mid])
	second_half = merge_sort(unsorted_array[mid, unsorted_array.length])
	
    merge(first_half, second_half)
end


def merge(left_array, right_array)
	sorted_array = []
	i = 0
	j = 0
	while(i< left_array.length && j < right_array.length)

		if(left_array[i] <= right_array[j])
			sorted_array.push left_array[i]
			i = i + 1
		else
			sorted_array.push right_array[j]
			j = j + 1
		end
	end
	while(i< left_array.length)
		sorted_array.push left_array[i]
		i = i + 1
	end
	while(j< right_array.length)
		sorted_array.push right_array[j]
		j = j + 1
	end
	sorted_array
end



def merge2(left_array, right_array)
    sorted_array = []
    # If either array is empty we don't need to compare them
    while !left_array.empty? && !right_array.empty? do
        # we are shifting out the compared/used values so we don't repeat
        if left_array[0] < right_array[0]
            sorted_array.push(left_array.shift)
        else   
            sorted_array.push(right_array.shift)
        end
    end 
    #concat appends elements of another array to an array
    return sorted_array.concat(left_array).concat(right_array)
end


# puts merge([1, 5, 9, 22], [2, 4, 8, 20, 23, 99]).to_s
 puts merge_sort([	9, 30, 2, 88, 3, 98, 45]).to_s