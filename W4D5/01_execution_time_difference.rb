# W4D5 Classwork
# Link: https://open.appacademy.io/learn/swe-in-person/ruby/execution-time-differences-algorithms


# my_min


# Phase 1

# Time Complexity: O(n^2)
# def my_min(arr)
#     min = arr[0]
#     (1...arr.length - 1).each do |i|
#         (i..arr.length - 1).each do |j|
#             if arr[j] < arr[i] && arr[j] < min
#                 min = arr[j]
#             end
#         end
#     end
#     min
# end


# Phase 2

# Time Complexity: O(n)
def my_min(arr)
    min = arr[0]
    (1...arr.length - 1).each do |i|
        min = arr[i] if min > arr[i]
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  #=>  -5


# Largest Contiguous Sub-sum
# Phase 1 => O(n^2)

# def largest_contiguous_subsum(arr)
#     subarrs = []
#     (0..arr.length - 1).each do |i|
#         (i..arr.length - 1).each do |j|
#             subarrs << arr[i..j]
#         end
#     end
#     max = subarrs[0].sum
#     subarrs.each do |sub|
#         max = sub.sum if sub.sum > max
#     end

#     max
# end

def largest_contiguous_subsum(arr)
    largest_sum = arr[0]
    current_sum = arr[0]
    (0...arr.length - 1).each do |i|
        current_sum = arr[i]
        largest_sum = current_sum if current_sum > largest_sum
        current_sum = arr[i] + arr[i + 1]
        largest_sum = current_sum if current_sum > largest_sum
    end
    largest_sum
end



# list = [5, 3, -7]
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list)

