require_relative 'board'
require_relative 'player'

class Game
  def initialize(attr = {})
    @player_red = Player.new('red')
    @player_blue = Player.new('blue')
    @board = Board.new
    @turn_count = 1 # Odd for red, Even for Blue, at 43 game over
    @win = false
  end

  def play
    welcome
    game_loop
  end

  def game_loop
    @board.render
    drop = current_player(@turn_count).input
    @board.add_piece(current_player(@turn_count), drop)
    check_win
    @turn_count += 1
    draw if board_full?(@turn_count)
    game_loop
  end

  def current_player(count)
    count % 2 == 0 ? @player_blue : @player_red
  end

  def board_full?(count)
    count >= 43 ? true : false
  end

  def welcome
    puts "Welcome to Connect 4!"
    puts "To place a piece please type the number of the column (0-6)."
    puts "The first player to place 4 pieces in a row wins!"
    puts "Press 'enter' to begin."
    gets
  end

  def check_win
    congratulations if @board.four_in_a_row?(current_player(@turn_count))
  end

  def congratulations
    puts "Congratulations #{current_player(@turn_count)}! You won."
    exit
  end

  def draw
    puts "I'm sorry, it's a draw!"
    exit
  end

end
