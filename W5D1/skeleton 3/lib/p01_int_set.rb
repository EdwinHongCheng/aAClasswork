require 'byebug'
class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max + 1) {false}
  end

  def insert(num)
    raise 'Out of bounds' if num > @store.length - 1 || num < 0
    @store[num] = true
  end
  
  def remove(num)
    @store[num] = false
  end
  
  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self[num].include?(num)
      self[num].push(num)
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(num)
    if self[num].include?(num)
      @count -= 1
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    current_store = @store.flatten
    @store = Array.new(@store.length * 2) {Array.new}
    current_store.each { |num| self[num].push(num) }
  end
end

# set = ResizingIntSet.new(20)
# elements = [*10..30]
