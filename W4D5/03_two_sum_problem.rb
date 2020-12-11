require "byebug"
# Bad sum => O(n^2)

def bad_two_sum?(arr, target_sum)
    (0...arr.length - 1).each do |i|
        (i + 1..arr.length - 1).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end

arr = [0, 1, 5, 7]

# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


# Phase 2

# Helper Method 

class Array
  def my_bsearch(target)
    return nil if size == 0
    mid = size/2

    case self[mid] <=> target
    when 0
      return mid
    when 1
      return self.take(mid).my_bsearch(target)
    else
      search_res = self.drop(mid+1).my_bsearch(target)
      search_res.nil? ? nil : mid + 1 + search_res
    end
  end
end

# Helper Method 1
def merge_sort(arr)
    return arr if arr.length == 1

    mid = arr.length / 2
    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid..-1])
    merge(left, right)
end

# Helper Method 2
def merge(arr1, arr2)
    merged = []
    while !arr1.empty? && !arr2.empty?
        if arr1[0] < arr2[0]
            merged << arr1.shift
        elsif arr1[0] > arr2[0]
            merged << arr2.shift
        else
            merged << arr1.shift
        end
    end

    merged + arr1 + arr2
end


def okay_two_sum?(arr, target_sum)
    sorted_arr = merge_sort(arr)

    sorted_arr.each do |ele|
        diff = target_sum - ele
        debugger
        return true if !sorted_arr.my_bsearch(diff).nil?
    end

    false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false