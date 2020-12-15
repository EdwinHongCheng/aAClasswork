require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count
  include Enumerable
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    index = bucket(key)
    @store[index].include?(key)
  end

  def set(key, val)
    index = bucket(key)
    if @store[index].include?(key)
      @store[index].update(key, val)
    else
      @store[index].append(key, val)
      @count += 1
      if @count > num_buckets
        resize!
      end
    end
  end

  

  def get(key)
    index = bucket(key)
    if @store[index].include?(key)
      @store[index].get(key)
    else
      nil
    end
  end

  def delete(key)
    index = bucket(key)
    if include?(key)
      @store[index].remove(key)
      @count -= 1
    end
  end

  # only used to update in resize
  # doesn't increment count
  def []=(key, val)
    index = bucket(key)
    if @store[index].include?(key)
      @store[index].update(key, val)
    else
      @store[index].append(key, val)
    end
  end

  def [](key)
    index = bucket(key)
    if @store[index].include?(key)
      @store[index].get(key)
    else
      nil
    end
  end

  def each(&prc)
    @store.each do |linked_list|
      linked_list.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    hash = {}
    @store.each do |linked_list|
      linked_list.each do |node|
        hash[node.key] = node.val
      end
    end
    @store = Array.new(@store.length * 2) {LinkedList.new}

    hash.keys.each do |key|
      index = bucket(key)
      @store[index].append(key, hash[key])
    end


    # old_store = @store
    # @store = Array.new(@store.length * 2) {LinkedList.new}
    # @count = 0
    # old_store.each do |linked_list|
    #   linked_list.each do |node|
    #     set(node.key, node.val)
    #   end
    # end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    key.hash % num_buckets
  end
end
