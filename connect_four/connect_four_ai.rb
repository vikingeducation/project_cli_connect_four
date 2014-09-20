require './connect_four_player.rb'

class ConnectFourAI < Player
  def move
    (0..6).each do |x|
      if @board.board[x].length <= 5 && @board.board[x]
        @board.board[x] << @color
        if @board.check_victory
          @board.add_piece(x, @color)
          @last_move = x
          return
        end
        @board.board[x].pop
      end
    end
    random = rand(7)
    @last_move = random
    @board.add_piece(random, @color)
  end
end