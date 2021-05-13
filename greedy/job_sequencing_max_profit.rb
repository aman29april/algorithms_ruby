# Given an array of jobs where every job has a deadline and associated profit if the job is finished before the deadline.
# It is also given that every job takes a single unit of time, so the minimum possible deadline for any job is 1.
# How to maximize total profit if only one job can be scheduled at a time.
# Input: Four Jobs with following
# deadlines and profits
# JobID  Deadline  Profit
#   a      4        20
#   b      1        10
#   c      1        40
#   d      1        30
# Output: Following is maximum
# profit sequence of jobs
#         c, a

# function to schedule the jobs take 2
# arguments array and no of jobs to schedule
def job_sequencing(arr, max_deadline)
  return if arr.empty?

  length = arr.length

  # sort array by decending profit
  arr.sort! { |a, b| b[2] <=> a[2] }.to_s

  # true denotes time_slot is empty
  time_slots = Array.new(max_deadline) { |_a| true }
  output = []
  profit = 0
  filled_slots = 0
  arr.each_with_index do |job, _index|
    min_deadline = [max_deadline, job[1]].min

    # as index start from 0, and min deadline can be 1. We decremented 1
    min_deadline -= 1

    # try to accomodate job at deadline or before
    while min_deadline >= 0
      # empty slot found
      if time_slots[min_deadline]
        time_slots[min_deadline] = false
        profit += job[2]
        output[min_deadline] = job[0]
        filled_slots += 1
        break
      end
      min_deadline -= 1
    end
    break if filled_slots == max_deadline
  end
  output
end

# Driver COde
# # Job Array
# With job name, deadline, profit
arr = [['a', 2, 100],
       ['b', 1, 19],
       ['c', 2, 27],
       ['d', 1, 25],
       ['e', 3, 15]]

print('Following is maximum profit sequence of jobs')

# Function Call
puts job_sequencing(arr, 3).to_s

arr = [['j1', 2, 60],
       ['j2', 1, 100],
       ['j3', 3,  20],
       ['j4', 2,  40],
       ['j5', 1,  20]]

puts job_sequencing(arr, 3).to_s
