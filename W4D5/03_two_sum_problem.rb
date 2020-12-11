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

def okay_two_sum?(arr, target_sum)
    current_dif = target_sum - arr.pop
    while !arr.empty?
        arr.each do |num|
            return true if current_dif == num
            arr.shift
            break if current_dif < num
        end
    end
    false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false