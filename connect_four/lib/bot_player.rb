# require './player.rb'

class BotPlayer < Player

  def choose_column 
    #i think, instead of duplicating the board, we should instantiate a new board, and copy the layout from the old board. 
    fake_board = BotBoard.new
    fake_board.layout = @board.layout.dup
    fake_board.layout.each do |column|
      puts "start of run"
      column_number = fake_board.layout.index(column)
      fake_board.add_piece(column_number, @piece)
      fake_board.display
      puts "this is the last move #{fake_board.last_move}"
      judge = WinJudge.new(fake_board.layout, fake_board.last_move)
      fake_board.display
      puts "this is the last move #{judge.last_move}"
      fake_board.remove_piece(fake_board.last_move)
      if judge.check_for_win?
        print "\n The wining column is #{fake_board.layout.index(column)}"
        return fake_board.layout.index(column)
      end
    end
    (rand(7) + 1) 
  end
end