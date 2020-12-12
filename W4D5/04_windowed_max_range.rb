# Phase 1: Naive Solution - O(n^3)

# def windowed_max_range(arr, w)
#     current_max_range = nil
#     (0..(arr.length - w)).each do |i|
#         current_min = arr[i..i + w - 1].min #O(n^2)
#         current_max = arr[i..i + w - 1].max
#         current_diff = current_max - current_min
#         current_max_range = current_diff if (current_max_range == nil || current_diff > current_max_range) 
#     end

#     current_max_range
# end



# Phase 2: MyQueue

class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def enqueue(ele)
    @store << ele
  end

  def dequeue
    @store.shift
  end
end


# Phase 3: MyStack

class MyStack # peek, size, empty?, pop, push
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(ele)
    @store << ele
  end
end


# Phase 4: StackQueue

# FIFO
class StackQueue # enqueue, dequeue methods
  def initialize
    @front_stack = MyStack.new
    @back_stack = MyStack.new
  end

  def size
    @front_stack.length + @back_stack.length 
  end

  def empty?
    @front_stack.empty? && @back_stack.empty?
  end

  def enqueue(ele)
    
  end

  def dequeue
    @store.shift
  end
end






# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8