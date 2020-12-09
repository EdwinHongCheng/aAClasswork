module Slideable
    HORIZONTAL_DIRS = [ [1, 0], [-1, 0], [0, 1], [0, -1] ] 
    DIAGONAL_DIRS = [ [1, 1], [1, -1], [-1, 1], [-1, -1] ]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end


    def diagonal_dirs
        DIAGONAL_DIRS
    end

    
    def moves
        #array of possible moves,
    end

    private
    def move_dirs
    end

    def grow_unblocked_moves_in_dir(dx, dy)

    end
end