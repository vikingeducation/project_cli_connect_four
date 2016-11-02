# require './player.rb'

class BotPlayer < Player

  def choose_column 
    #i think, instead of duplicating the board, we should instantiate a new board, and copy the layout from the old board. 
    fake_board = Board.new
    fake_board.layout.each do |column|
      fake_board.layout = @board.layout.dup
      column_number = fake_board.layout.index(column) + 1
      fake_board.add_piece(column_number, @piece)
      judge = WinJudge.new(fake_board.layout, fake_board.last_move)
      if judge.check_for_win?
        return fake_board.layout.index(column)
      end
    end
    (rand(7) + 1) 
  end
end