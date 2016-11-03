# Game
# - match draw (when board full)
# - win condition
# - player turn logic

class Game
  def initialize(attr = {})
    @playerRed = attr[:playerRed]
    @playerBlue = attr[:playerBlue]
    @board = attr[:board]
    @turnCount = 1 # Odd for red, Even for Blue, at 43 game over
    @win = false
  end

  def play
    welcome
    game_loop
  end

  def game_loop
    @board.render
    drop = current_player(@turnCount).input
    @board.add_piece(current_player(@turnCount), drop)
    check_win
  end

  def current_player(count)
    count % 2 == 0 ? @playerBlue : @playerRed
  end

  def welcome
    puts "Welcome to Connect 4!"
    puts "To place a piece please type the number of the column (0-6)."
    puts "Press 'enter' to begin."
    gets
  end

  def check_win
    @board.four_in_a_row?(player)
  end

end
