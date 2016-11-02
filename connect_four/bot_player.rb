# require './player.rb'

class BotPlayer < Player

  def choose_column
    fake_board = @board
    fake_board.layout do |column|
      fake_board.add_piece(column, @piece)
      judge = BoardJudge.new(fake_board.layout, fake_board.last_move)
      if judge.check_for_win?
        return column.index 
      end
    end
    (rand(7) + 1) 
  end
end