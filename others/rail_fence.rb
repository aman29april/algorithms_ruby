def encrypt(str, number_of_rails)
  rails = Array.new(number_of_rails) { |_i| Array.new(str.length) }

  dir_down = false
  row = 0
  (0...(str.length)).each do |i|
    dir_down = !dir_down if row.zero? || row == number_of_rails - 1
    # puts [dir_down, row].to_s
    rails[row][i] = str[i]

    dir_down ? row += 1 : row -= 1
  end
  output = ''
  rails.each do |row|
    output += row.join
  end
  puts output
  output
end

def decrypt(cipher, number_of_rails)
  rails = Array.new(number_of_rails) { |_i| Array.new(cipher.length) }

  row = 0
  (0...(cipher.length)).each do |i|
    dir_down = !dir_down if row.zero? || row == number_of_rails - 1
    rails[row][i] = '*'
    dir_down ? row += 1 : row -= 1
  end

  char_pos = 0
  rails.each do |row|
    row.each_with_index do |row_char, index|
      if row_char == '*'
        row[index] = cipher[char_pos]
        char_pos += 1
      end
    end
  end
  # puts rails.to_s

  row = 0
  output = ''
  (0...(cipher.length)).each do |i|
    dir_down = !dir_down if row.zero? || row == number_of_rails - 1
    output << rails[row][i]
    dir_down ? row += 1 : row -= 1
  end
  output
end

str = 'WEAREDISCOVEREDFLEEATONCE'
cipher = encrypt(str, 3)

decrypted_text = decrypt(cipher, 3)

puts decrypted_text == str
