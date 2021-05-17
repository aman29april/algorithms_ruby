# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @param {Integer[]} profit
# @return {Integer}
Job = Struct.new(:start, :end, :profit, :pos)
def job_scheduling(start_time, end_time, profit)
  return if start_time.length.zero?
  return profit[0] if start_time.length == 1

  jobs = []
  (0...start_time.length).each do |i|
    jobs << Job.new(start_time[i], end_time[i], profit[i], i + 1)
  end
  jobs.sort_by!(&:profit).reverse!
  schedule = Array.new(end_time.max)

  profit = 0

  (0...jobs.length).each do |i|
    available = true
    current_job = jobs[i]
    (jobs[i].start...jobs[i].end).each do |j|
      if schedule[j]
        available = false
        break
      end
    end
    next unless available

    (jobs[i].start...jobs[i].end).each do |j|
      schedule[j] = true
    end

    profit += jobs[i].profit
  end
  profit
end
