require 'byebug'
require_relative 'poly_tree'

class KnightPathFinder
    attr_reader :current_pos, :node
    attr_accessor :considered_positions

    def initialize(current_pos)
        @current_pos = current_pos
        @considered_positions = []
        @node = PolyTreeNode.new(current_pos)
        build_move_tree
    end

    def self.valid_moves(pos)
        possible_moves = []

        move_1 = [pos[0]+1, pos[1]+2]
        possible_moves << move_1 if KnightPathFinder.in_bounds?(move_1)

        move_2 = [pos[0]-1, pos[1]+2] 
        possible_moves << move_2 if KnightPathFinder.in_bounds?(move_2)

        move_3 = [pos[0]+1, pos[1]-2]
        possible_moves << move_3 if KnightPathFinder.in_bounds?(move_3)

        move_4 = [pos[0]-1, pos[1]-2]
        possible_moves << move_4 if KnightPathFinder.in_bounds?(move_4)

        move_5 = [pos[0]+2, pos[1]+1]
        possible_moves << move_5 if KnightPathFinder.in_bounds?(move_5)

        move_6 = [pos[0]-2, pos[1]+1] 
        possible_moves << move_6 if KnightPathFinder.in_bounds?(move_6)

        move_7 = [pos[0]+2, pos[1]-1]
        possible_moves << move_7 if KnightPathFinder.in_bounds?(move_7)

        move_8 = [pos[0]-2, pos[1]-1]
        possible_moves << move_8 if KnightPathFinder.in_bounds?(move_8)

        possible_moves
    end

    # Helper Method
    def self.in_bounds?(pos)
        return false if pos[0] < 0 || pos[0] > 7
        return false if pos[1] < 0 || pos[1] > 7
        return true
    end

    def new_move_positions(pos)

        filtered_pos = KnightPathFinder.valid_moves(pos)
        answers = filtered_pos.select do |position|
            !@considered_positions.include?(position)
        end

        @considered_positions += answers
        answers
    end

    def build_move_tree
        queue = [@node]

        while !queue.empty?

            new_pos = queue.shift
            children = new_move_positions(new_pos.value)

            children.each do |child|
                node_child = PolyTreeNode.new(child)
                new_pos.add_child(node_child)
                queue << node_child
            end
        end
    end

    def find_path(end_pos)
        end_node = @node.bfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        node_path = [end_node]
        pos_path = []
        searching = true
        while searching
            searching = false
            node = node_path[-1]
            pos_path << node.value
            if node.parent
                node_path << node.parent
                searching = true
            end
        end
        pos_path.reverse
    end
end

new_knight = KnightPathFinder.new([0,0])
new_knight.build_move_tree
p new_knight.find_path([7,6])
p new_knight.find_path([6,2])
