# game.rb
require_relative 'player'
require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @current_player = [@player1, @player2].sample
  end

  def play
    print_instructions
    loop do
      @board.render
      make_next_move
      check_if_game_over
      switch_players
    end
  end

  def make_next_move
    until @board.receive_move?(@current_player.move) do
      puts "That column is full."
    end
  end

  def check_if_game_over
    if @board.check_winner?(@current_player.piece)
      @board.render
      puts "#{@current_player.name} wins!"
      exit
    elsif @board.tie?
      puts "It's a tie!"
      exit
    end
  end

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def print_instructions
    puts
    puts "Welcome to Connect Four."
    puts "Enter the number of the column (1-7) where you want to put your piece in."
    puts "#{@current_player.name} wins the toss, and will go first."
    puts
  end
end

# Game object
g = Game.new
g.play
