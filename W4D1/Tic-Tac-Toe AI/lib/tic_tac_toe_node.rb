require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator) # evaluator is :x or :o
    # base case
    if @board.over? 
      return @board.won? && @board.winner != evaluator 
    end

    if evaluator == @next_mover_mark
      return self.children.all? { |child_node| child_node.losing_node?(evaluator) }
    else
      return self.children.any? { |child_node| child_node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    # base case
    if @board.over? 
      return board.winner == evaluator
    end

    if evaluator == @next_mover_mark
      return self.children.any? { |child_node| child_node.winning_node?(evaluator) }
    else
      return self.children.all? { |child_node| child_node.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_pos = []
    @board.rows.each_with_index do |el1, i1|
      @board.rows.each_with_index do |el2, i2|
        possible_pos << [i1, i2] if @board.empty?([i1, i2])
      end
    end
    children_arr = []
    child_mark = nil
    if @next_mover_mark == :x
      child_mark = :o
    else  
      child_mark = :x
    end
    possible_pos.each do |pos|
      
      dup_board = @board.dup
      dup_board[pos] = @next_mover_mark
      child_node = TicTacToeNode.new(dup_board, child_mark, pos)

      children_arr << child_node
    end
    children_arr
  end
end
