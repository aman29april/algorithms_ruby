# Rail Fence Cipher

# Create two functions to encode and then decode a string using the Rail Fence Cipher. This cipher is used to encode a string by placing each character successively in a diagonal along a set of "rails". First start off moving diagonally and down. When you reach the bottom, reverse direction and move diagonally and up until you reach the top rail. Continue until you reach the end of the string. Each "rail" is then read left to right to derive the encoded string.

# For example, the string "WEAREDISCOVEREDFLEEATONCE" could be represented in a three rail system as follows:

# W       E       C       R       L       T       E
#   E   R   D   S   O   E   E   F   E   A   O   C
#     A       I       V       D       E       N

# The encoded string would be:

# WECRLTEERDSOEEFEAOCAIVDEN

# Write a function/method that takes 2 arguments, a string and the number of rails, and returns the ENCODED string.




def encrypt(str, number_of_rails)
  rails = Array.new(number_of_rails) { |i|  Array.new(str.length)}

  dir_down = false
  row = 0
  for i in (0...(str.length))
    dir_down = !dir_down if row.zero? || row == number_of_rails -1
    # puts [dir_down, row].to_s
    rails[row][i] = str[i]

    dir_down ? row +=1 : row -= 1
  end
  output = ""
  rails.each do |row|
    output += row.join
  end
  output

end

def decrypt(cipher, number_of_rails)
  rails = Array.new(number_of_rails) { |i|  Array.new(cipher.length)}

  row = 0
  for i in (0...(cipher.length))
    dir_down = !dir_down if row.zero? || row == number_of_rails -1
    rails[row][i] = '*'
    dir_down ? row +=1 : row -= 1
  end

  char_pos = 0
  rails.each do |row|
    row.each_with_index do |row_char, index|
      if row_char == '*'
        row[index] =  cipher[char_pos]
        char_pos += 1
      end
    end
  end
  # puts rails.to_s

  row = 0
  output = ""
  dir_down = false
  for i in (0...(cipher.length))
    dir_down = !dir_down if row.zero? || row == number_of_rails -1

    output << rails[row][i]
    dir_down ? row +=1 : row -= 1
  end
  output

end

str = "WEAREDISCOVEREDFLEEATONCE"
cipher = encrypt(str, 3)

decrypted_text = decrypt(cipher, 3)

puts decrypted_text == str

