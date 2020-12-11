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
# Phase 1 => O(n^3)

# def largest_contiguous_subsum(arr)
#     subarrs = []
#     (0..arr.length - 1).each do |i|
#         (i..arr.length - 1).each do |j|
#             subarrs << arr[i..j] # O(n) because we slice into an array
#         end
#     end

#     max = subarrs[0].sum

#     subarrs.each do |sub|
#         current_sum = sub.sum
#         max = current_sum if current_sum > max
#     end

#     max
# end

# O(n)
def largest_contiguous_subsum(arr)
    largest_sum = arr[0]
    current_sum = 0
    (0..arr.length - 1).each do |i|
        if arr[i] + current_sum < 0
            largest_sum = arr[i] if arr[i] > largest_sum
            current_sum = 0
            next
        end

        current_sum += arr[i]
        largest_sum = current_sum if current_sum > largest_sum
    end
    largest_sum
end


list1 = [5, 3, -7] #=> 8
list2 = [2, 3, -6, 7, -6, 7] #=> 8
list3 = [-2, -3, -1, -4] #=> -1

p largest_contiguous_subsum(list1)
p largest_contiguous_subsum(list2)
p largest_contiguous_subsum(list3)
