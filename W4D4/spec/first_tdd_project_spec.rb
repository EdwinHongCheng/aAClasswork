require "rspec"
require "first_tdd_project"

describe 'Array#my_uniq' do

    #want to test if my_uniq doesn't use Array#uniq

    it "removes duplicates from an array" do
        expect([1, 2, 1, 3, 3].my_uniq.length).to eq(3)
    end

    it "returns the unique elements in the order in which they first appeared" do
        expect([7, 7, 8, 8, 9, 9, 9, 0].my_uniq).to eq([7, 8, 9, 0])
    end

end

describe 'Array#two_sum' do

    it "finds all pairs of positions where the elements at those positions sum to zero" do
        expect([-1, 0, 1].two_sum).to eq([[0, 2]])
    end

    it "returns the index pairs with the smaller index first" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

end

describe "#my_transpose" do

    #want to test if my_transpose doesn't use Array#transpose

    let(:matrix) { [[0, 1, 2],[3, 4, 5],[6, 7, 8]] }

    it "returns a tranposed matrix" do
        expect(my_transpose(matrix)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end

end

describe "#stock_picker" do
    let(:stock_prices) { [0, 99, 100] } 

    it "returns a pair of numbers" do
        expect(stock_picker(stock_prices).length).to eq(2)
    end

    it "returns an ordered pair of days" do
        expect(stock_picker(stock_prices)[0] < stock_picker(stock_prices)[1]).to eq(true)
    end

end

describe HanoiTowers do
    subject(:towers) { HanoiTowers.new(5) }

    describe "#initialize" do

        it "sets stacks to a 2D array with three subarrays" do
            expect(towers.stacks.length).to eq(3)
        end

        it "sets a specified number of stacks to the first subarray" do
            expect(towers.stacks[0]).to eq([1, 2, 3, 4, 5])
        end

    end

    describe "#move_disk" do
        it "takes the top disk from a stack and places the chosen disk on top of another stack" do
            towers.move_disk
            expect(towers.stacks == [[2, 3, 4, 5],[1],[]] || towers.stacks == [[2, 3, 4, 5],[],[1]]).to eq(true)
        end

        it "never has larger disks on top of smaller disks" do
            towers.move_disk
            expect(towers.stacks[0]).to eq(towers.stacks[0].sort)
            expect(towers.stacks[1]).to eq(towers.stacks[1].sort)
            expect(towers.stacks[2]).to eq(towers.stacks[2].sort)
        end

        it "places the disk on another stack" do
            stack1 = towers.stacks[0].dup
            towers.move_disk
            expect(towers.stacks[0]).to_not eq(stack1)
        end

    end

    describe "#won" do
        it "returns true if all the disks are on a single stack other than the starting stack" do
            expect(towers.won?).to eq(false)
            towers.stacks[0], towers.stacks[2] = towers.stacks[2], towers.stacks[0]
            expect(towers.won?).to eq(true)
        end
    end

end
