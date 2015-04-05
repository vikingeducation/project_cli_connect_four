require './connect_four_player.rb'

class ConnectFourAI < Player
  def move
    (0..6).each do |x|
      if @board.board[x].length <= 5 && @board.board[x]
          @board.add_piece(x, @color)
        if @board.check_victory
          @last_move = x
          return
        else
          @board.board[x].pop
        end
      end
    end
    random = rand(7)
    @last_move = random
    @board.add_piece(random, @color)

    puts "\nAI MOVE:\n"


  end


end