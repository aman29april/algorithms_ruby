ASCII85 is a binary-to-ASCII encoding scheme that's used within PDF and Postscript, and which provides data-size savings over base 64. Your task is to extend the String object with two new methods, toAscii85 (to_ascii85 in ruby) and fromAscii85 (from_ascii85 in ruby), which handle encoding and decoding ASCII85 strings.

As Python does not allow modifying the built-in string class, for Python the task is to provide functions toAscii85(data) and fromAscii85(ascii85), which handle encoding and decoding ASCII85 strings (instead of string object methods).

As Swift strings are very picky about character encodings (and don't take kindly to storing binary data), in Swift, extend Data with a toAscii85 method and String with a fromAscii85 method.

The toAscii85 method should take no arguments and must encode the value of the string to ASCII85, without any line breaks or other whitespace added to the native ASCII85-encoded value.

Example:

'easy'.toAscii85() should return <~ARTY*~>
'moderate'.toAscii85() should return <~D/WrrEaa'$~>
'somewhat difficult'.toAscii85() should return <~F)Po,GA(E,+Co1uAnbatCif~>
The fromAscii85 method should take no arguments and must decode the value of the string (which is presumed to be ASCII85-encoded text).

Example:

'<~ARTY*~>'.fromAscii85() should return easy
'<~D/WrrEaa\'$~>'.fromAscii85() should return moderate
'<~F)Po,GA(E,+Co1uAnbatCif~>'.fromAscii85() should return somewhat difficult
You can learn all about ASCII85 here. And remember, this is a binary-to-ASCII encoding scheme, so the input isn't necessarily always a readable string! A brief summary of the salient points, however, is as follows:

In general, four binary bytes are encoded into five ASCII85 characters.
The character set that ASCII85 encodes into is the 85 characters between ASCII 33 (!) and ASCII 117 (u), as well as ASCII 122 (z), which is used for data compression (see below).
In order to encode, four binary bytes are taken together as a single 32-bit number (you can envision concatenating their binary representations, which creates a 32-bit binary number). You then serially perform division by 85, and add 33 to the remainder of each division to get the ASCII character value for the encoded value; the first division and addition of 33 is the rightmost character in the encoded five-character block, etc. (This is all represented well is the visualization in the Wikipedia page's example.)
If the last block to be encoded contains less than four bytes, it's padded with nulls to a total length of four bytes, and then after encoding, the same number of characters are removed as were added in the padding step.
If a block to be encoded contains all nulls, then that block is encoded as a simple z (ASCII 122) rather than the fully-encoded value of !!!!!.
The final encoded value is surrounded by <~ at the start and ~> at the end. In the wild, whitespace can be inserted as needed (e.g., line breaks for mail transport agents); in this challenge, whitespace shouldn't be added to the final encoded value for the sake of checking the fidelity of the encoding.
Decoding applies the above in reverse; each block of five encoded characters is taken as its ASCII character codes, multiplied by powers of 85 according to the position in the block of five characters (again, see the Wikipedia example visualization), and then broken into four separate bytes to determine the corresponding binary values.
If a block to be decoded contains less than five characters, it is padded with u characters (ASCII 117), decoded appropriately, and then the same number of characters are removed from the end of the decoded block as us were added.
All whitespace in encoded values is ignored (as in, it's removed from the encoded data before the data is broken up into the five-character blocks to be decoded).


To make your testing easier, two functions are preloaded for your use if you wish:

generateRandomReadableStrings(num, len): generates an array of num strings of length len containing only readable ASCII characters
generateRandomBinaryData(num, len): generates an array of num strings of length len containing binary data (ASCII code 0—255)











Your team is working on a project for a retail chain which keeps their stores' weekly open hours listings as an array of data. The data is in the following format:

open_hours = [
  {
    :day => "Monday",
    :open => "8:00 AM",
    :close => "5:00 PM"
  },
  {
    :day => "Tuesday",
    :open => "8:00 AM",
    :close => "5:00 PM"
  },
  {
    :day => "Wednesday",
    :open => "8:00 AM",
    :close => "6:00 PM"
  },
  {
    :day => "Thursday",
    :open => "8:00 AM",
    :close => "5:00 PM"
  },
  {
    :day => "Friday",
    :open => "8:00 AM",
    :close => "5:00 PM"
  },
  {
    :day => "Saturday",
    :open => "8:00 AM",
    :close => "4:00 PM"
  }
]
However, the company's website needs the data to be transformed to a grouped format for displaying to visitors. The grouped format is as follows:

grouped_open_hours = [
  {
    :days => "Monday-Tuesday",
    :open => "8:00 AM",
    :close => "5:00 PM"
  },
  {
    :days => "Wednesday",
    :open => "8:00 AM",
    :close => "6:00 PM"
  },
  {
    :days => "Thursday-Friday",
    :open => "8:00 AM",
    :close => "5:00 PM"
  },
  {
    :days => "Saturday",
    :open => "8:00 AM",
    :close => "4:00 PM"
  },
  {
    :days => "Sunday",
    :open => nil,
    :close => nil
  }
]
In the output above, any consecutive days sharing the same open and close times have been compressed into the same hash. Whenever consecutive days sharing open and close times are encountered, the first and last day in the range are concatenated with a hyphen for the :day key.

Your task is to write code to perform the transformation. The function you'll complete is group_open_hours(open_hours). The function should return the transformed hash array in the above format.

The output array should be in order of the days of the week. Consider Monday as the beginning of the week and Sunday as the end. No range that bridges the gap between Sunday-Monday should be created (but a range from Monday-Sunday is valid whenever the entire week has the same open/closed hours or the input is empty.

As shown above, any missing days of the week should be added to the returned array as hashes with :open: nil and :close: nil entries. When the missing dates consist of consecutive ranges, they should use the same hyphenated grouped :days key format as open days would be.

The open_hours parameter will always be well-formed but may be empty and unsorted. There will never be more than 7 hashes in the array, and each hash is guaranteed to have only :day, :open and :close keys present with string values formatted as in the structure shown above. All day keys are guaranteed to be unique in open_hours and correctly capitalized, valid days of the week.

Please do not mutate the open_hours parameter.

