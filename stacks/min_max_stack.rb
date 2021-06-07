class MinMaxStack
  def initialize
    @stack = []
    @min_max_stack = []
  end

  def push(val)
    new_min_max = [val, val]
    if @min_max_stack.any?
      last_min_max = @min_max_stack.last
      new_min_max[0] = [last_min_max[0], new_min_max[0]].min
      new_min_max[1] = [last_min_max[1], new_min_max[1]].max
    end
    @min_max_stack << new_min_max
    @stack << val
  end

  def get_min
    @min_max_stack.last[0] if @min_max_stack.any?
  end

  def get_max
    @min_max_stack.last[1] if @min_max_stack.any?
  end

  def peek
    @stack[-1] if @stack.any?
  end

  def pop
    if @stack.any?
      @min_max_stack.pop
      @stack.pop
    end
  end
end

stack = MinMaxStack.new
stack.push 5
puts stack.get_min
puts stack.get_max
puts stack.peek

stack.push 7
puts stack.get_min
puts stack.get_max
puts stack.peek

stack.push 2
puts stack.get_min
puts stack.get_max
puts stack.peek

puts stack.pop
puts stack.pop

puts stack.get_min
puts stack.get_max
puts stack.peek
