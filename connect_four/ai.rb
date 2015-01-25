require './board.rb'

class AI
  attr_reader :player_id
  attr_accessor :board

  def initialize(player_id, board)
    @player_id = player_id
    @board = board
  end

  def pick_column
    if pick_rationally
      pick_rationally
    else
      pick_randomly
    end
  end

  def pick_rationally
    (0..6).each do |column|
      board_copy = board.dup
      board_copy.insert_coin(column, player_id)
      if board_copy.win?
        return column+1
      end
    end
    return false
  end

  def pick_randomly
    (1..7).to_a.sample
  end

  def detect_win

  end

end