require 'RSpec'
require 'date'

def group_open_hours(open_hours)

  # if all are empty, return all days nil hash
  return [empty_day('Monday-Sunday')] if open_hours.empty?

  output = []
  count = 0
  input = {}

  # convert input array to hash with day as key
  open_hours.each do |hash|
    # change day key to days as in output we need days
    hash[:days] = hash.delete :day
    input[hash[:days]] = hash
  end

  # traverse from Monday to Sunday
  Date::DAYNAMES.rotate(1).each do |day|
    last = output[-1]
    current = input[day] || {}

    if output.any? && match?(current, last)
        output[-1][:days] = updated_days(output[-1][:days], day)
    elsif current != {}
      output << current
    else
      output << empty_day(day)
    end
  end

  output
end

def match?(day1, day2)
  day1[:open] == day2[:open] && day1[:close] == day2[:close]
end

def updated_days(str, day)
  days = str.split('-')
  days[1] = day
  days.join('-')
end

def empty_day(day)
  {
    days: day,
    open: nil,
    close: nil
  }
end


RSpec.describe 'group_open_hours' do
  it 'should work on the provided example' do
    open_hours = [
      {
        day: 'Monday',
        open: '8:00 AM',
        close: '5:00 PM'
      },
      {
        day: 'Tuesday',
        open: '8:00 AM',
        close: '5:00 PM'
      },
      {
        day: 'Wednesday',
        open: '8:00 AM',
        close: '6:00 PM'
      },
      {
        day: 'Thursday',
        open: '8:00 AM',
        close: '5:00 PM'
      },
      {
        day: 'Friday',
        open: '8:00 AM',
        close: '5:00 PM'
      },
      {
        day: 'Saturday',
        open: '8:00 AM',
        close: '4:00 PM'
      }
    ]
    expected = [
      {
        days: 'Monday-Tuesday',
        open: '8:00 AM',
        close: '5:00 PM'
      },
      {
        days: 'Wednesday',
        open: '8:00 AM',
        close: '6:00 PM'
      },
      {
        days: 'Thursday-Friday',
        open: '8:00 AM',
        close: '5:00 PM'
      },
      {
        days: 'Saturday',
        open: '8:00 AM',
        close: '4:00 PM'
      },
      {
        days: 'Sunday',
        open: nil,
        close: nil
      }
    ]
    actual = group_open_hours(open_hours)
    expect(actual).to eq(expected)
  end

  it 'should handle ranges of closed days' do
    open_hours = [
      {
        day: 'Monday',
        open: '9:00 AM',
        close: '4:00 PM'
      },
      {
        day: 'Tuesday',
        open: '9:00 AM',
        close: '4:00 PM'
      },
      {
        day: 'Wednesday',
        open: '9:00 AM',
        close: '4:00 PM'
      },
      {
        day: 'Thursday',
        open: '9:00 AM',
        close: '4:00 PM'
      }
    ]
    expected = [
      {
        days: 'Monday-Thursday',
        open: '9:00 AM',
        close: '4:00 PM'
      },
      {
        days: 'Friday-Sunday',
        open: nil,
        close: nil
      }
    ]
    actual = group_open_hours(open_hours)
    expect(actual).to eq(expected)
  end
end

puts group_open_hours([{ day: 'Sunday', open: '9:00 AM', close: '4:00 PM' },
                  { day: 'Tuesday', open: '9:00 AM', close: '4:00 PM' },
                  { day: 'Wednesday', open: '9:00 AM', close: '4:00 PM' },
                  { day: 'Thursday', open: '9:00 AM', close: '4:00 PM' }])
