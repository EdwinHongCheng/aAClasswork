class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    crypt = 0
    self.each_with_index do |ele, i|
        if ele.is_a?(Integer)
          crypt += ele.hash * i
        elsif ele.is_a?(String)
          crypt += ele.hash * i
        elsif ele.is_a?(Array)
          count = 3
          crypt += count + ele.hash 
        end
    end
    crypt *= self.length + 1
  end
end

class String
  def hash
    crypt = 0
    self.each_char.with_index do |char, i|
      crypt += char.ord ** i
    end
    crypt *= self.length + 1
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.keys.hash * 1000 + self.values.hash * 29
  end
end
