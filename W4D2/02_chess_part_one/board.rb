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

    def empty? # if this is a null piece or not (false if not a Null piece)
        self.is_a?(NullPiece)
    end

    def valid_moves #return the array of valid move pos

    end
end


class NullPiece < Piece

    def initialize
        @null_piece = "X" #placeholder code - delete later
    end
end


class Rook < Piece
    def initialize(color, board, pos)
        super
        @symbol = "R"
    end

    private
    def move_dirs

    end
end

module Slideable
    HORIZONTAL_DIRS = []
    DIAGONAL_DIRS = []

    def horizontal_dirs
    end


    def diagonal_dirs
    end

    
    def moves
    end

    private
    def move_dirs
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        
    end
end



class Bishop < Piece
end


class Queen < Piece
end


class Knight < Piece
end

class King < Piece
end


class Pawn < Piece
end





