require "singleton"

class Piece
    attr_reader :color, :pos

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
    attr_reader :symbol

    def initialize(color, board, pos)
        super
        @symbol = :R
    end

    private
    def move_dirs

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