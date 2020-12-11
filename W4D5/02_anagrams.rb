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
def anagram?(str1, str2)

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


    merged
end

# Tests
p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true