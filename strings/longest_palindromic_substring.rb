# Longest Palindromic Substring
# Input: Given string :"forgeeksskeegfor",
# Output: "geeksskeeg"

# Input: Given string :"Geeks",
# Output: "ee"

def longest_palindrom(str)
  return str if str.length <= 1

  result = ''
  (0...str.length - 1).each do |i|
    ((i + 1)...str.length).each do |j|
      substr = str[i, j]
      result = substr if is_palindrom?(substr) && (result.length < substr.length)
    end
  end
  result
end

def longest_palindrom_dp(str)
  length = str.length
  return str if length <= 1

  result = str[0]

  dp = Array.new(length) { |_i| Array.new(length, false) }
  (0...length).each do |gap|
    (gap...length).each do |j|
      if gap == 0
        dp[j - gap][j] = true
      elsif gap == 1
        if str[j - gap] == str[j]
          dp[j - gap][j] = true
          result = str[j - gap..j]
        end
      elsif str[j - gap] == str[j] && dp[j - gap + 1][j - 1]
        dp[j - gap][j] = true
        result = str[j - gap..j]
      end
    end
  end
  result
end

def is_palindrom?(str)
  return true if str.length <= 1

  i = 0
  j = str.length - 1
  while i < j
    if str[i] == str[j]
      i += 1
      j -= 1
      next
    end
    return false
  end
  true
end

puts longest_palindrom_dp('forgeeksskeegfor')
puts longest_palindrom_dp('Geeks')
puts longest_palindrom_dp('bb')
puts longest_palindrom_dp('lphntrsqudccteewsdmpjmgmfnxegawjclzobpnxdrvxeygafiwyqsvsecictqkmiqvrdjajfngvlhdezdpqpzjjzbhoyggrbkuzeocrpzqishvfairdvvabopyubfisxbrgnlughbrzunitwowvnsqhdtnkotitgxwzjhbgltksorygpdberdgzgvogrvwluhixfbrfhliedjylxuspjpitwlhdkneonreqrueqphirmgxtqumllqropaefddplspkrtkbmuvwkyryworojlvwzdlacuoqzokrmcgmwkopsbqjjkaoqjqbrderwzmhbhfgwvrjakyfeqcbtvlcgbsxkngymxyievihiskdmmppmmdksihiveiyxmygnkxsbgclvtbcqefykajrvwgfhbhmzwredrbqjqoakjjqbspokwmgcmrkozqoucaldzwvljorowyrykwvumbktrkpslpddfeaporqllmuqtxgmrihpqeurqernoenkdhlwtipjpsuxlyjdeilhfrbfxihulwvrgovgzgdrebdpgyrosktlgbhjzwxgtitokntdhqsnvwowtinuzrbhgulngrbxsifbuypobavvdriafvhsiqzprcoezukbrggyohbzjjzpqpdzedhlvgnfjajdrvqimkqtcicesvsqywifagyexvrdxnpbozlcjwagexnfmgmjpmdsweetccduqsrtnhpl')
