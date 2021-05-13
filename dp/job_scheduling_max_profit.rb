# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @param {Integer[]} profit
# @return {Integer}
Job = Struct.new(:start, :end, :profit, :pos)
def job_scheduling(start_time, end_time, profit)
    return if start_time.length.zero?
    return profit[0] if start_time.length == 1

    jobs = []
    for i in (0...start_time.length)
        jobs << Job.new(start_time[i], end_time[i], profit[i], i+1)
    end
    jobs.sort_by!(&:profit).reverse!
    schedule = Array.new(end_time.max)

    profit = 0

    for i in (0...jobs.length)
        available = true
        current_job = jobs[i]
        for j in (jobs[i].start...jobs[i].end)
             if schedule[j]
                 available = false
                 break
             end
        end
        next unless available
        for j in (jobs[i].start...jobs[i].end)
             schedule[j] = true
        end

        profit += jobs[i].profit

    end
    profit
end
