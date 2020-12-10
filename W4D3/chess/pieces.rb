require "singleton"
require_relative "modules"
require "byebug"

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
    include Steppable
    attr_reader :symbol

    def initialize(color, board, pos)
        super
        @symbol = :N
    end

    protected
    def move_diffs
        [ [1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,1], [-2,-1] ]
    end
end

class King < Piece
    include Steppable
    attr_reader :symbol

    def initialize(color, board, pos)
        super
        @symbol = :K
    end

    protected
    def move_diffs
        moves = [ [-1, -1,], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1] ]
    end
end


class Pawn < Piece
    attr_reader :symbol 
    def initialize(color, board, pos)
        super
        @symbol = :p
    end
    
    def moves
        side_attacks # placeholder for testing (to access the private method)
    end

    private
    def at_start_row? # checked - working
        if color == "white" && pos[0] == 1
            true
        elsif color == "black" && pos[0] == 6
            true
        else
            false
        end
    end

    def forward_dir
        if color == "white" 
            return 1
        elsif color == "black"
            return -1
        end
    end

    def side_attacks # WIP - has bugs

        good_side_attacks = []

        current_pos = self.pos

        moves_to_examine = []

        if color == "white"
            i, j = current_pos
            if (i < 0 || i > 7) || (j < 0 || j > 7)
                moves_to_examine << [i + 1, j - 1]
                moves_to_examine << [i + 1, j + 1] 
            end
        elsif color == "black"
            i, j = current_pos
            if (i < 0 || i > 7) || (j < 0 || j > 7)
                moves_to_examine << [i - 1, j + 1] 
                moves_to_examine << [i - 1, j - 1]
            end
        end

        

        # if the piece at the board position is opposite color, move is valid
        # put it into good side attacks array
        moves_to_examine.each do |pos|

            # might have issues here - check with debugger
            if @board[pos].color != self.color && !@board[pos].is_a?(NullPiece)
                good_side_attacks << pos
            end
            # debugger
        end

        good_side_attacks
    end

end