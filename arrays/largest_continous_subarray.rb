# largest continous subarray


def largest_continous_subarray_brutforce(ar)
	largest_sum = 0
	for i in 0...ar.length-1
		sum = ar[i]
		for j in i+1...ar.length
			sum += ar[j]

			if(sum > largest_sum)
				largest_sum = sum
			end
		end
		
	end
	largest_sum
end

def largest_subarray_kadanes_algo(ar)
	max_so_far, max_ending_here = 0, 0
	for e in ar
		max_ending_here += e
		if(max_ending_here < 0 )
			max_ending_here = 0
		end
		if(max_ending_here > max_so_far)
			max_so_far = max_ending_here
		end 
	end
	max_so_far
end

def largest_subarray_kadanes_print_index(ar)
	max_so_far, max_ending_here = 0, 0
	start, ending = 0, 0
	i = 0
	s = 0
	for e in ar
		max_ending_here += e
		if(max_ending_here < 0 )
			max_ending_here = 0
			s = i + 1
		end
		if(max_ending_here > max_so_far)
			max_so_far = max_ending_here
			ending = i
			start = s
		end 
		i += 1
	end
	[start, ending]

end



ar = [-2, -3, 4, -1, -2, 1, 5, -3]

# puts largest_continous_subarray_brutforce(ar)

# puts largest_subarray_kadanes_algo(ar)

puts largest_subarray_kadanes_print_index(ar).to_a