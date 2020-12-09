require "singleton"
require_relative "modules"

class Piece
    attr_reader :color, :pos
    attr_accessor :board

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

  
    # def to_s
    #     @color + self.to_s 
    # end

    def empty? # if this is a null piece or not (false if not a Null piece)
        self.is_a?(NullPiece)
    end

    def valid_moves #return the array of valid move pos

    end
end


class NullPiece < Piece
    include Singleton
    attr_reader :symbol
    def initialize
        @symbol = :X #placeholder code - delete late
    end
end



class Rook < Piece
    include Slideable

    attr_reader :symbol

    def initialize(color, board, pos)
        super
        @symbol = :R
    end

    private
    def move_dirs
        horizontal_dirs
    end
end


class Bishop < Piece
    include Slideable
    attr_reader :symbol 

    def initialize(color, board, pos)
        super
        @symbol = :B
    end

    private
    def move_dirs
        diagonal_dirs
    end
end


class Queen < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, pos)
        super
        @symbol = :Q
    end

    private
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end


class Knight < Piece
    def initialize(color, board, pos)
        super
        @symbol = :N
    end

    private
    def move_diffs
        moves = [ [1,2], [1,-2], [-1,2], [-1,-2, [2,1], [2,-1], [-2,1], [-2,-1] ]
    end
end

class King < Piece
    def initialize(color, board, pos)
        super
        @symbol = :K
    end

    private
    def move_diffs

    end
end


class Pawn < Piece
    def initialize(color, board, pos)
        super
        @symbol = :p
    end
end