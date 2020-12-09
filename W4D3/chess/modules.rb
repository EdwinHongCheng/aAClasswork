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

        queue = []

        horizontal_dirs.each_with_index do |dir, idx|
            
            horizontal_dirs.grow_unblocked_moves_in_dir(horizontal_dirs[idx][0], horizontal_dirs[idx][1]0
        end
        
    end

    private
    def move_dirs
    end

    # Helper Method for #moves
    def grow_unblocked_moves_in_dir(dx, dy)
        # check if position is within bounds vs nil
        if (start_pos[0] > 7 || start_pos[0] < 0) || (start_pos[1] > 7 || start_pos[1] < 0)
        if (end_pos[0] > 7 || end_pos[0] < 0) || (end_pos[1] > 7 || end_pos[1] < 0)


        raise "there is no piece at #{start_pos}" if self[start_pos].empty?
        raise "piece cannot move to #{end_pos}" if self[start_pos].color == self[end_pos].color


    end
end