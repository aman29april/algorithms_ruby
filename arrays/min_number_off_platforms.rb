# Minimum Number of Platforms Required for a Railway/Bus Station
# Given arrival and departure times of all trains that reach a railway station, the task is to find the minimum number of platforms required for the railway station so that no train waits.
# We are given two arrays which represent arrival and departure times of trains that stop.
# Input: arr[] = {9:00, 9:40, 9:50, 11:00, 15:00, 18:00}
# dep[] = {9:10, 12:00, 11:20, 11:30, 19:00, 20:00}
# Output: 3
# Explanation: There are at-most three trains at a time (time between 11:00 to 11:20)

# Input: arr[] = {9:00, 9:40}
# dep[] = {9:10, 12:00}
# Output: 1
# Explanation: Only one platform is needed.

def min_platforms(arr, dep)
  max = 1
  (1...arr.length).each do |i|
    count = 1
    (0...i).each do |j|
      count += 1 if dep[j] > arr[i]
    end
    max = [max, count].max
  end
  max
end

def min_platforms_efficient(arr, dep)
  arr.sort!
  dep.sort!
  n = arr.length
  max = 1
  count = 1

  i = 1
  j = 0
  while i < n && j < n
    if arr[i] <= dep[j]
      count += 1
      i += 1
    elsif dep[j] < arr[i]
      count -= 1
      j += 1
    end

    max = [max, count].max

  end
  max
end

arr = [900, 940, 950, 1100, 1500, 1800]
dep = [910, 1200, 1120, 1130, 1900, 2000]

puts min_platforms_efficient(arr, dep)
