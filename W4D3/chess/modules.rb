module Slideable
    HORIZONTAL_DIRS = [ [1, 0], [-1, 0], [0, 1], [0, -1] ] 
    DIAGONAL_DIRS = [ [1, 1], [1, -1], [-1, 1], [-1, -1] ]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end


    def diagonal_dirs
        DIAGONAL_DIRS
    end

    
    #array of possible moves
    def moves

        current_pos = self.pos

        all_unblocked_moves = []
        all_good_moves = []

        move_dirs.each do |dir|
            dx, dy = dir
            all_unblocked_moves << grow_unblocked_moves_in_dir(dx, dy)
        end
        
        all_unblocked_moves.each do |pos|
            
        end

        all_good_moves
    end

    private
    def move_dirs
    end

    # Helper Method for #moves
    def grow_unblocked_moves_in_dir(dx, dy)
       all_unblocked_moves = []
        
       current_pos = self.pos
       while (current_pos[0] >= 0 && current_pos[0] <= 7) && (current_pos[1] >= 0 && current_pos[1] <= 7)
        current_pos[0] += dx
        current_pos[1] += dy
        all_unblocked_moves << current_pos
       end

       all_unblocked_moves
    end
end