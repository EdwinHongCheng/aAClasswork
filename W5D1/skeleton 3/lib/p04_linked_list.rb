require 'byebug'


class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty? # must do #append 1st
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end

    nil
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.prev = last
    @tail.prev.next = node # set last next to node
    @tail.prev = node
    node.next = @tail

  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        break
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        break
      end
    end
  end

  def each(&prc)
    prc ||= Proc.new {|node| node}
    current_node = @head.next
    while current_node != @tail
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  def [](index)
    idx_count = 0
    self.each do |node|
      return node if idx_count == index
      idx_count += 1
    end
    nil
  end
  # uncomment when you have `each` working and `Enumerable` included

  
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
