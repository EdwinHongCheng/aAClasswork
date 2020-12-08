class Board
    attr_accessor :rows

    def initialize
        @rows =  Array.new(8) { Array.new(8) }
    end

    def [](pos)

    end

    def []=(pos, val)

    end

    def move_piece(start_pos, end_pos)
        # set piece at start_pos to end_pos
        # set start_pos to null_piece
        # raise if !valid_moves.include?(end_pos) # assuming valid_moves is an array for a certain piece
    end
end


class Piece

    def initialize
        @piece = "P"
    end
end


class NullPiece < Piece

    def initialize
        @null_piece = "X"
    end
end