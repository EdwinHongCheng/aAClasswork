require "byebug"

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
        all_good_moves = []

        current_pos = self.pos
        all_unblocked_moves = []

        move_dirs.each do |dir| # for Rook: [ [1, 0], [-1, 0], [0, 1], [0, -1] ] 
            dx, dy = dir
            all_unblocked_moves << grow_unblocked_moves_in_dir(dx, dy)
        end
        
        # For Rook:
        # ali unblocked moves = [ one_dir_set1, one_dir_set2..... one_dir_set4 ]
        # one_dir_set1 = [ [1,0], ..... [7,0] ]

        all_unblocked_moves.each_with_index do |one_dir_set, idx|
            
            one_dir_set.each do |pos|
                if @board[pos].is_a?(NullPiece)
                    all_good_moves << pos
                elsif @board[pos].color == self.color
                    break
                else # opposite color's piece
                    all_good_moves << pos
                    break
                end
            end
        end

        all_good_moves
    end

    private
    def move_dirs
    end

    # Helper Method for #moves
    def grow_unblocked_moves_in_dir(dx, dy) # example: 1, 0
       all_unblocked_moves = []
        
       current_pos = self.pos.dup

    #    debugger

       i = current_pos[0] + dx
       j = current_pos[1] + dy
       while (i >= 0 && i <= 7) && (j >= 0 && j <= 7)
        new_pos = [i, j]
        all_unblocked_moves << new_pos
        i += dx
        j += dy
       end

       all_unblocked_moves
    end

end


module Steppable

    def moves
        all_good_moves = []

        current_pos = self.pos
        
        move_diffs.each do |pos|
            if @board[pos].is_a?(NullPiece)
                all_good_moves << pos
            elsif @board[pos].color == self.color
                break
            else # opposite color's piece
                all_good_moves << pos
                break
            end
        end

        all_good_moves
    end

    # def grow_unblocked_moves_in_diff(dx, dy) # example: 1, 0
    #    all_unblocked_moves = []
        
    #    current_pos = self.pos.dup

    

    #    i = current_pos[0] + dx
    #    j = current_pos[1] + dy
    #    while (i >= 0 && i <= 7) && (j >= 0 && j <= 7)
    #     new_pos = [i, j]
    #     all_unblocked_moves << new_pos
    #     i += dx
    #     j += dy
    #    end

    #    all_unblocked_moves
    # end

    private
    
    def move_diffs

    end
    
end