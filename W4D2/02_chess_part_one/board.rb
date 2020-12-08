class Board
    attr_accessor :rows

    def initialize
        @rows =  Array.new(8) { Array.new(8) }
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
        # set piece at start_pos to end_pos
        # set start_pos to null_piece
        # raise if !valid_moves.include?(end_pos) # assuming valid_moves is an array for a certain piece
    end
end


class Piece
    attr_reader :color, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        @color + self.to_s 
    end

    def empty?
    end

    def valid_moves
        #return the array of valid moves
    end
end


class NullPiece < Piece

    def initialize
        @null_piece = "X"
    end
end