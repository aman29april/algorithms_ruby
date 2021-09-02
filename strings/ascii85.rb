# ASCII85 is a binary-to-ASCII encoding scheme that's used within PDF and Postscript,
# and which provides data-size savings over base 64.
# Your task is to extend the String object with two new methods, toAscii85 (to_ascii85 in ruby)
# and fromAscii85 (from_ascii85 in ruby), which handle encoding and decoding ASCII85 strings.
# https://en.wikipedia.org/wiki/Ascii85#Example
#
#

require 'RSpec'

class String
  ASCII85_OPENING = '<~'
  ASCII85_CLOSING = '~>'
  ASCII85_BLANK = ASCII85_OPENING + ASCII85_CLOSING
  ASCII85_BASE = 85
  ASCII85_STEP = 33
  ASCII85_IGNORE = [' ', "\t", "\r", "\n", "\f", "\0"]

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
    z_and_space_count = input.scan(/\s/).length + input.count('z')
    padding = -(input.length - z_and_space_count) % 5

    # padding if length is not div by 5
    input << ('u' * padding)

    # Decode
    word   = 0
    count  = 0
    output = []

    input.each_char do |char|
      case char
      when *ASCII85_IGNORE # Ignore spaces
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
    output = output.pack('N*')

    padding == 0 ? output : output[0..-(padding + 1)]
  end
end

puts 'Man '.to_ascii85
puts '<~ARTY*~>'.from_ascii85
puts '<~ARTY*~>'.from_ascii85

RSpec.describe 'Challenge' do
  it 'Should handle encoding' do
    expect(' '.to_ascii85).to eq('<~+9~>')
    expect('.'.to_ascii85).to eq('<~/c~>')
    expect('o'.to_ascii85).to eq('<~DZ~>')
    expect('Man '.to_ascii85).to eq('<~9jqo^~>')
    expect('ok'.to_ascii85).to eq('<~Def~>')
    expect('very'.to_ascii85).to eq('<~G%G]>~>')
    expect('easy'.to_ascii85).to eq('<~ARTY*~>')
    expect('very easy'.to_ascii85).to eq('<~G%G]>+D"u&Gl~>')
    expect('moderate'.to_ascii85).to eq("<~D/WrrEaa'$~>")
    expect('somewhat difficult'.to_ascii85).to eq('<~F)Po,GA(E,+Co1uAnbatCif~>')
    expect(' quite harder now. '.to_ascii85).to eq('<~+E;O<FCcS.@<,miEZf7<G:k!~>')
    expect('                 '.to_ascii85).to eq('<~+<VdL+<VdL+<VdL+<VdL+9~>')
    expect('whitespace    test'.to_ascii85).to eq('<~GA(]4ATMg!@q?d)ATMq~>')
  end

  it 'Should handle decoding' do
    expect('<~~>'.from_ascii85).to eq('<~~>')
    expect('<~/c~>'.from_ascii85).to eq('.')
    expect('<~+9~>'.from_ascii85).to eq(' ')
    expect('<~ARTY*~>'.from_ascii85).to eq('easy')
    expect('<~DZ~>'.from_ascii85).to eq('o')
    expect('<~9jqo^~>'.from_ascii85).to eq('Man ')
    expect('<~Def~>'.from_ascii85).to eq('ok')
    expect('<~G%G]>~>'.from_ascii85).to eq('very')
    expect('<~G%G]>+D"u&Gl~>'.from_ascii85).to eq('very easy')
    expect("<~D/WrrEaa'$~>".from_ascii85).to eq('moderate')
    expect('<~F)Po,GA(E,+Co1uAnbatCif~>'.from_ascii85).to eq('somewhat difficult')
    expect('<~+E;O<FCcS.@<,miEZf7<G:k!~>'.from_ascii85).to eq(' quite harder now. ')
    expect('<~+<VdL+<VdL+<VdL+<VdL+9~>'.from_ascii85).to eq('                 ')
    expect('<~GA(]4ATMg !@q?d)ATMq~>'.from_ascii85).to eq('whitespace test')
  end
end
