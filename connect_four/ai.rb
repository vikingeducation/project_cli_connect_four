require './board.rb'

class AI
  attr_reader :player_id
  attr_accessor :game_board

  def initialize(player_id, game_board)
    @player_id = player_id
    @game_board = game_board
  end

  def pick_column
    rational_choice = pick_rationally
    if rational_choice
      rational_choice
    else
      pick_randomly
    end
  end

  private

  def pick_rationally
    (0..6).each do |column|
      board_copy = Board.new
      board_copy.board = game_board.board.map { |column| column.dup }
      board_copy.insert_coin(column, player_id)
      if board_copy.win?
        return column + 1
      end
    end
    return false
  end

  def pick_randomly
    (1..7).to_a.sample
  end
end