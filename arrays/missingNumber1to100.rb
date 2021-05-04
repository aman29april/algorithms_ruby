def getMissingNo(ar)
	n = ar.length + 1
	total = n * (n + 1) / 2
	sum_of_ar = ar.sum
	return total - sum_of_ar
end

ar = [1, 2, 3, 4, 6, 7, 9, 8, 10]
print getMissingNo(ar)

