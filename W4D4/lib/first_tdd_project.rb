# Would like to check if methods we don't want are being used

class Array
    def my_uniq
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        answer = []
        hash.each_key { |ele| answer << ele }
        answer
    end

    def two_sum
        answer = []
        self.each_with_index do |num1, idx1|
            self.each_with_index do |num2, idx2|
                if idx1 < idx2 && num1 + num2 == 0
                    answer << [idx1, idx2]
                end
            end
        end
        answer
    end
end

def my_transpose(matrix)
    answer = []

    matrix.each_with_index do |col, idx1|
        new_row = []
        matrix.each_with_index do |row, idx2|
            new_row << matrix[idx2][idx1]
        end
        answer << new_row
    end

    answer
end


def stock_picker(stock_prices)
    lowest_price = stock_prices[0]
    lowest_day = 0

    highest_price = stock_prices[0]
    highest_day = 0

    (1...stock_prices.length).each do |day|
        if stock_prices[day] < lowest_price
            lowest_price = stock_prices[day]
            lowest_day = day
        end
    end

    (1...stock_prices.length).each do |day|
        if stock_prices[day] > highest_price && day > lowest_day
            highest_price = stock_prices[day]
            highest_day = day
        end
    end


    return nil if lowest_day > highest_day
    [lowest_day, highest_day]
end

class HanoiTowers
    attr_reader :stacks, :size
    
    def initialize(num)
        raise "Number must be 1 or greater" if num < 1
        @size = num
        @stacks = Array.new(3) { Array.new}
        (1..num).each { |disc| @stacks[0] << disc }
    end

    def move_disk
        puts "Enter the stack number of the stack you would like to take a disk from (0, 1, or 2)"

        chosen_stack = gets.chomp.to_i
        while stacks[chosen_stack].empty? || stacks[chosen_stack] == nil
            puts "Invalid stack chosen"
            puts "Enter the stack number of the stack you would like to take a disk from (0, 1, or 2)"
            chosen_stack = gets.chomp.to_i
        end

        chosen_disk = stacks[chosen_stack].shift
        puts "Enter the stack number of the new stack you would like to place the disk"
        target_stack = gets.chomp.to_i
        while target_stack == chosen_stack || stacks[target_stack] == nil || (chosen_disk > stacks[target_stack][0] if !stacks[target_stack].empty?)
            puts "Invalid stack chosen"
            puts "Enter the stack number of the new stack you would like to place the disk"
            target_stack = gets.chomp.to_i
        end

        stacks[target_stack].unshift(chosen_disk)
    end

    def won?
        (stacks[1] == (1..size).to_a) || (stacks[2] == (1..size).to_a)
    end

    def render
        puts
        stacks.each { |row| p row.reverse } 
        puts
    end

    def play
        while !won?
            render
            move_disk
        end
        puts
        puts "Congrats! You won, buddy!"
        puts "How about trying #{@size+1} disks next time?"
        puts
    end

end


game = HanoiTowers.new(1)
game.play