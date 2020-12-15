class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self[key].include?(key)
      self[key].push(key)
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(key)
    if self[key].include?(key)
      @count -= 1
      self[key].delete(key)
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  private


  def [](key)
    # optional but useful; return the bucket corresponding to (key`
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    current_store = @store.flatten
    @store = Array.new(@store.length * 2) {Array.new}
    current_store.each { |key| self[key].push(key) }
  end
end
