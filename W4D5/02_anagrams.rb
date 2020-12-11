# Phase 1

def anagram?(str1, str2)
    arr.permutation((arr.length)).include?(str)
end

# Tests
p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true