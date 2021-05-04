# @param {String} s
# @return {String}
def longest_palindrome(s)
    return "" if s.empty?
    
    chars = s.chars.zip(s.size.times.map { '|' }).flatten.unshift('|')
    n = chars.size
    
    p_len = Array.new(3, n)
    p_len[0] = 0
    p_len[1] = 1
    
    max_len, max_len_pos = 0, 0
    
    center = 1
    right = 2
    
    2.step(n - 1).each do |i|   # want to use enumerator; n.times.drop(2) makes (n-2) length array
        mirror = 2 * center - i
        diff = right - i
        
        expand = false
        
        if 0 < diff
            len = p_len[mirror]
            
            if len < diff
                p_len[i] = len
                
            elsif len == diff && i == n - 1
                p_len[i] = len
                
            elsif len == diff && i < n - 1
                p_len[i] = len
                expand = true
                
            elsif diff < len
                p_len[i] = diff
                expand = true
                
            end
        else
            p_len[i] = 0
            expand = true
        end
        
        if expand
            while (i + p_len[i]) < n && 0 < (i - p_len[i]) && (not_boundary_char(p_len, i) || same_char?(chars, p_len, i))
                p_len[i] += 1
            end
        end
        
        if max_len < p_len[i]
            max_len = p_len[i]
            max_len_pos = i
        end
        
        if i < i + p_len[i]
            center = i
            right = i + p_len[i]
        end
    end
    
    first = (max_len_pos - max_len) / 2
    last = first + max_len - 1
    s[first..last]
end

def not_boundary_char(p_len, i)
    (i + p_len[i] + 1) % 2 == 0
end

def same_char?(chars, p_len, i)
    chars[i - p_len[i] - 1] == chars[i + p_len[i] + 1]
end