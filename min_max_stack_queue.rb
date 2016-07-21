class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
    el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.dup.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  def initialize
    @store = []
    @previous_max = {}
    @current_max = nil
    @previous_min = {}
    @current_min = nil
  end

  def max
    @current_max
  end

  def min
    @current_min
  end

  def push(el)
    @store << el
    @previous_max[size - 1] = @current_max
    @current_max = el if @current_max.nil? || el > @current_max
    @previous_min[size - 1] = @current_min
    @current_min = el if @current_min.nil? || el < @current_min
    el
  end

  def pop
    el = @store.pop
    @current_max = @previous_max[size]
    @current_min = @previous_min[size]
    el
  end

  def peek
    @store.dup.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @add_stack = MyStack.new
    @pop_stack = MyStack.new
  end

  def max
    if @add_stack.empty?
      @pop_stack.max
    elsif @pop_stack.empty?
      @add_stack.max
    else
      [@add_stack.max,@pop_stack.max].max
    end
  end

  def min
    if @add_stack.empty?
      @pop_stack.min
    elsif @pop_stack.empty?
      @add_stack.min
    else
      [@add_stack.min,@pop_stack.min].min
    end
  end

  def enqueue(el)
    @add_stack.push(el)
    el
  end

  def dequeue
    slinky if @pop_stack.empty?
    @pop_stack.pop
  end

  def peek
    slinky if @pop_stack.empty?
    @pop_stack.peek
  end

  def size
    @add_stack.size + @pop_stack.size
  end

  def empty?
    @add_stack.empty? && @pop_stack.empty?
  end

  private

  def slinky
    until @add_stack.empty?
      @pop_stack.push(@add_stack.pop)
    end
  end
end
