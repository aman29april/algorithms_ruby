# There is one meeting room in a firm.
# There are N meetings in the form of (S[i], F[i])
# where S[i] is the start time of meeting i and F[i] is finish time of meeting i.
# The task is to find the maximum number of meetings that can be accommodated in the meeting room.
# Print all meeting numbers

# class Meeting
#   attr_accessor :start, :ending, :pos
#   def initialize(start, ending, pos)
#     @start = start
#     @end = ending
#     @pos = pos
#   end
# end
#
Meeting = Struct.new(:start, :end, :pos)

def max_meeting(start, finish)
  length = start.length
  meetings = []
  (0...length).each do |i|
    meetings << Meeting.new(start[i], finish[i], i + 1)
  end

  meetings.sort_by!(&:end)

  output = []
  output << meetings.shift
  meetings.each do |meeting|
    output << meeting if output.last.end <= meeting.start
  end
  output.map { |e| e.pos }
end
# Starting time
s = [1, 3, 0, 5, 8, 5]

# Finish time
f = [2, 4, 6, 7, 9, 9]

puts max_meeting(s, f).to_s

# max_meeting([75250, 50074, 43659, 8931, 11273, 27545, 50879, 77924],
#   [112960, 114515, 81825, 93424, 54316, 35533, 73383, 160252])
