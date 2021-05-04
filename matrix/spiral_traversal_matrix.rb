# Print a given matrix in spiral form
# Input:  1    2   3   4
#         5    6   7   8
#         9   10  11  12
#         13  14  15  16
# Output: 1 2 3 4 8 12 16 15 14 13 9 5 6 7 11 10 
# Explanation: The output is matrix in spiral format.



# a = [[1, 2, 3, 4, 5, 6],
#      [7, 8, 9, 10, 11, 12],
#      [13, 14, 15, 16, 17, 18]]


#  output    1 2 3 4 5 6 12 18 17 16 15 14 13 7 8 9 10 11 


def spiral_traversal(ar)
	result = []
	rows, cols = ar.length, ar[0].length

	left, right = 0, cols-1
	top, bottom = 0, rows-1

	while left <= right && top <= bottom
		(left..right).each do |j|
			result.append ar[left][j]
		end

		((left + 1)..bottom).each do |i|
			result.append ar[i][right]
		end

		if(top<bottom && left < right)
			(right-1).downto(left+1).each do |j|
				result.append ar[bottom][j]
			end
		end

		if(left <right && left < right)
			(bottom-1).downto(top+1).each do |i|
				result.append ar[i][left]
			end
		end

		left+=1
		right-=1
		top+=1
		bottom-=1
	end
	puts result
end

arr = [[1, 2, 3, 4],
       [5, 6, 7, 8],
       [9, 10, 11, 12],
       [13, 14, 15, 16]]




# spiral_traversal(arr)

arr = [[1, 2, 3, 4, 5, 6],
     [7, 8, 9, 10, 11, 12],
     [13, 14, 15, 16, 17, 18]]

 spiral_traversal(arr)
