class Game

  def initialize(num_of_players=1)
    @player1 = Player.new
    @board = Board.new

    if num_of_players == 1
      @player2 = Computer.new
    else
      @player2 = Player.new
    end

    @current_player = @player1
  end

  until game.over?

    @board.render

    @current_player.get_move

    check_win

    check_full_board

    switch_player

  end

end

class Player

end

class Computer

end

class Board

end
