require "singleton"

require_relative "pieces"
require_relative "modules"


class Board
    attr_accessor :rows, :null_piece

    def initialize
        @null_piece = NullPiece.instance
        @rows =  Array.new(8) { Array.new(8, null_piece) }
        
        # set up pieces: helper method
        set_board
    end

    # Helper Method
    def set_board
        # Blue Pieces
        @rows[0].each_with_index do |piece, idx|
            @rows[0][idx] = King.new("blue", self, [0, idx])
        end

        @rows[1].each_with_index do |piece, idx|
            @rows[1][idx] = King.new("blue", self, [1, idx])
        end


        # Red Pieces
        @rows[6].each_with_index do |piece, idx|
            @rows[6][idx] = King.new("red", self, [6, idx])
        end

        @rows[7].each_with_index do |piece, idx|
            @rows[7][idx] = King.new("red", self, [7, idx])
        end
    end

    def render
        @rows.each do |row|
            p row.map {|piece| piece.symbol}
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        # check if position is within bounds vs nil
        raise "#{start_pos} is out of bounds" if (start_pos[0] > 7 || start_pos[0] < 0) || (start_pos[1] > 7 || start_pos[1] < 0)
        raise "#{end_pos} is out of bounds" if (end_pos[0] > 7 || end_pos[0] < 0) || (end_pos[1] > 7 || end_pos[1] < 0)


        raise "there is no piece at #{start_pos}" if self[start_pos].empty?
        raise "piece cannot move to #{end_pos}" if self[start_pos].color == self[end_pos].color

        self[end_pos] = self[start_pos].dup
        self[start_pos] = @null_piece
    end
end


board = Board.new
board.render
p board[[1,0]].moves
