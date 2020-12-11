# Phase 1

# def anagram?(str1, str2)
#     arr1 = str1.split("")

#     anagrams = arr1.permutation((arr1.length)).to_a.map { |sub_arr| sub_arr.join("")}
#     anagrams.include?(str2)

# end


# Phase 2

# O(n^2)
# def anagram?(str1, str2)
#     str1.each_char do |char|
#         str2.delete!(char)
#     end
#     str2.length == 0
# end


# Phase 3

# def anagram?(str1, str2)
#     arr1 = str1.split("")
#     arr2 = str2.split("")
#     merged_1 = merge_sort(arr1)
#     merged_2 = merge_sort(arr2)
#     merged_1 == merged_2
# end

# # Helper Method 1
# def merge_sort(arr)
#     return arr if arr.length == 1

#     mid = arr.length / 2
#     left = merge_sort(arr[0...mid])
#     right = merge_sort(arr[mid..-1])
#     merge(left, right)
# end

# # Helper Method 2
# def merge(arr1, arr2)
#     merged = []
#     while !arr1.empty? && !arr2.empty?
#         if arr1[0] < arr2[0]
#             merged << arr1.shift
#         elsif arr1[0] > arr2[0]
#             merged << arr2.shift
#         else
#             merged << arr1.shift
#         end
#     end

#     merged + arr1 + arr2
# end


# Phase 4

# Time Complexity: O(n)

# def anagram?(str1, str2)
#     hash_1 = Hash.new(0)
#     hash_2 = Hash.new(0)

#     str1.each_char do |char|
#         hash_1[char] += 1
#     end

#     str2.each_char do |char|
#         hash_2[char] += 1
#     end

#     hash_1 == hash_2
# end


# Bonus

# Time Complexity: O(n)
def anagram?(str1, str2)
    hash = Hash.new(0)

    str1.each_char do |char|
        hash[char] += 1
    end

    str2.each_char do |char|
        hash[char] -= 1
    end
    
    hash.all? { |k, v| v == 0 } # O(1)
end

# # Tests
p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true

