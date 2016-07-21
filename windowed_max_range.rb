require_relative 'min_max_stack_queue'

def windowed_max_range(array, window_size)
  current_max_range = 0
  (0..array.size-window_size).each do |index|
    window = array[index,window_size]
    current_diff = window.max - window.min
    current_max_range = current_diff if current_diff > current_max_range
  end
  current_max_range
end

def windowed_max_range2(array, window_size)
  window = StackQueue.new

  (0...window_size).each do |i|
    window.enqueue(array[i])
  end

  current_max_range = window.max - window.min

  (window_size...array.size).each do |index|
    window.dequeue
    window.enqueue(array[index])
    current_diff = window.max - window.min
    current_max_range = current_diff if current_diff > current_max_range
  end

  current_max_range
end


p windowed_max_range2([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range2([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range2([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range2([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
