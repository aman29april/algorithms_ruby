# https://leetcode.com/problems/merge-intervals/
# Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

#  Example 1: Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

def merge(intervals)
  return intervals if intervals.size <= 1

  # sort based on start time
  intervals.sort! { |l, r| l[0] <=> r[0] }

  output = [intervals[0]]
  (1..intervals.length - 1).each do |i|
    interval = intervals[i]
    last = output[-1]
    # if start time of interval is greater than end of previous
    if interval[0] > last[1]
      output << interval
    else
      # update ending as max of current interval and last interval
      last[1] = [interval[1], last[1]].max
    end
  end
  output
end

puts merge([[1, 3], [2, 6], [8, 10], [15, 18]]).to_s
puts merge([[1, 2], [3, 5], [4, 7], [6, 8], [9, 10]]).to_s
puts merge([[1, 4], [2, 3]]).to_s
