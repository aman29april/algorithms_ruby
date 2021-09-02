class String
  ASCII85_OPENING = '<~'
  ASCII85_CLOSING = '~>'
  ASCII85_BLANK = ASCII85_OPENING + ASCII85_CLOSING
  ASCII85_BASE = 85
  ASCII85_STEP = 33

  # Encodes string as Ascii85.
  def to_ascii85
    return ASCII85_BLANK if empty? || self == ASCII85_BLANK

    # padding will be calculated on negative number. As we need number of items to add more
    # to make it divisible by 4
    padding = (-length) % 4

    # Extract big-endian integers
    input = self + ("\0" * padding)
    base32_integers = input.unpack('N*')

    output = base32_integers.map do |int32|
      if int32.zero?
        'z'
      else
        str = ''
        5.times do
          str << ((int32 % ASCII85_BASE) + ASCII85_STEP).chr
          int32 /= ASCII85_BASE
        end
        str.reverse
      end
    end

    # We can't use the z-abbreviation if we're going to cut off padding
    output[-1] = '!!!!!' if output[-1] == 'z' && padding > 0

    # Cut off the padding
    output[-1] = output[-1][0..(4 - padding)]

    ASCII85_OPENING + output.join + ASCII85_CLOSING
  end

  # Decodes Ascii85 string
  def from_ascii85
    return self if empty?

    # string between opening and closing
    input = self[2..length - 3]

    # input.gsub!(' ')
    padding = -(input.length - input.count(' ')) % 5

    # padding if length is not div by 5
    input << ('u' * padding)

    # Decode
    word   = 0
    count  = 0
    output = []

    input.each_char do |char|
      case char
      when ' ', "\t", "\r", "\n", "\f", "\0" # Ignore spaces
        next
      when 'z'
        output << 0 if count == 0
      else
        # Decode 5 characters into a 4-byte word
        word  += (char.ord - ASCII85_STEP) * ASCII85_BASE**(4 - count)
        count += 1

        # 5 chars are grouped together to form single word
        if count == 5
          # put word in output and reset values.
          output << word
          word  = 0
          count = 0
        end

      end
    end

    # Convert output to the String
    output.pack('N*')

    # if count > 0

    #   tuple = input[-count, -1]
    #   word = 0
    #   tuple.each_char.with_index do |char, i|
    #     word  += (char.ord - ASCII85_STEP) * ASCII85_BASE**i
    #   end
    #   # Finish last, partially decoded 32-bit-word
    #   count -= 1
    #   word  += ASCII85_BASE**(4 - count)

    #   output << word

    #   output << ((word >> 24) & 255).chr if count >= 1
    #   output << ((word >> 16) & 255).chr if count >= 2
    #   output << ((word >> 8) & 255).chr if count == 3
    # end
  end
end

puts 'Man '.to_ascii85
puts '<~ARTY*~>'.from_ascii85
puts '<~ARTY*~>'.from_ascii85
