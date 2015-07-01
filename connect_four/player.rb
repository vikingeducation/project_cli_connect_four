class Player
  def move
    raise NotImplemented
  end
end

class AI < Player

  def initialize(board, player_num)
    @board = board
    @player_num = player_num
  end

  def board_copy
    return Board.new(@board.state)
  end

  def winning_move
    moves = (0..5).to_a
    moves.each do |col|
      correct_move = simulate_move(col, @player_num)
      return col if correct_move
    end
    return nil
  end

  def simulate_move(col, player)
    sim_board = board_copy
      unless sim_board.col_full?(col)
        sim_board.move([col,player])
        if sim_board.winner
          return sim_board.winner
        end
      end
      return nil
  end

  def opponent
    (@player_num - 1).abs
  end

  def living_move
    moves = (0..5).to_a
    moves.each do |col|
      correct_move = simulate_move(col, opponent)
      return col if correct_move
    end
    return nil
  end

  def random_move
    moves = (0..5).to_a
    sim_board = board_copy
    moves.reject!{|col| sim_board.col_full?(col)}
    moves.sample
  end

  def move
    potential_move ||= winning_move
    potential_move ||= living_move
    potential_move ||= random_move
    return potential_move
  end

end

class Human < Player

  def move
    puts "Input a move Col 1 to 6"
    col_to_add_to = gets.chomp.to_i
    col_to_add_to -= 1
    until col_to_add_to >= 0 && col_to_add_to < 6
      puts "Invalid column number, try again!"
      col_to_add_to = self.move
    end
    col_to_add_to

  end

end

