# Phase 1 O(n^3)

def windowed_max_range(arr, w)
    current_max_range = nil
    (0..(arr.length - w)).each do |i|
        current_min = arr[i..i + w - 1].min #O(n^2)
        current_max = arr[i..i + w - 1].max
        current_diff = current_max - current_min
        current_max_range = current_diff if (current_max_range == nil || current_diff > current_max_range) 
    end

    current_max_range
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8