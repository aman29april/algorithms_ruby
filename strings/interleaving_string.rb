# Interleaving of two given strings with no common characters
# Given three strings A, B and C. Write a function that checks whether C is an interleaving of A and B.

# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
    i,j = 0, 0
    l1, l2 = s1.length, s2.length
    l = s3.length
    return false if l != l1 + l2
    s3.each_char do |c|
        if(c == s1[i] && i < l1)
            i += 1
        elsif(c == s2[j] && j < l2)
            j += 1
        else
           return false 
        end
    end
    return true
end


def is_interleave_recursion(s1, s2, s3)
    i,j = 0, 0
    l1, l2 = s1.length, s2.length
    l = s3.length
    return false if l != l1 + l2
    s3.each_char.with_index do |c, index|
        if(c == s1[i] && i < l1)
            return is_interleave_recursion(s1[i+1, l1-1], s2, s3[index+1, l-1])
        elsif(c == s2[j] && j < l2)
            return is_interleave_recursion(s1, s2[j+1, l2-1], s3[index+1, l-1])
        else
           return false 
        end
    end
    return true
end

puts is_interleave_recursion('AB', 'CD', 'ACBG')
puts is_interleave_recursion('AB', 'CD', 'CDAB')