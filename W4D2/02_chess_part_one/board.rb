require "singleton"

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
        # check if position is within bounds vs nil
        raise "#{start_pos} is out of bounds" if (start_pos[0] > 7 || start_pos[0] < 0) || (start_pos[1] > 7 || start_pos[1] < 0)
        raise "#{end_pos} is out of bounds" if (end_pos[0] > 7 || end_pos[0] < 0) || (end_pos[1] > 7 || end_pos[1] < 0)


        raise "there is no piece at #{start_pos}" if self[start_pos].empty?
        raise "piece cannot move to #{end_pos}" if self[start_pos].color == self[end_pos].color

        self[end_pos] = self[start_pos].dup
        self[start_pos] = NullPiece.new
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
    # include Singleton

    def initialize
        @null_piece = :X #placeholder code - delete late
    end
end



class Rook < Piece
    def initialize(color, board, pos)
        super
        @symbol = :R
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
    def initialize(color, board, pos)
        super
        @symbol = :B
    end
end


class Queen < Piece
    def initialize(color, board, pos)
        super
        @symbol = :Q
    end
end


class Knight < Piece
    def initialize(color, board, pos)
        super
        @symbol = :N
    end
end

class King < Piece
    def initialize(color, board, pos)
        super
        @symbol = :K
    end
end


class Pawn < Piece
    def initialize(color, board, pos)
        super
        @symbol = :p
    end
end





