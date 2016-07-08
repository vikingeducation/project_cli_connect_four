# game.rb

=begin
Class: Game
  play
  make_next_move
  check_if_game_over
  switch_players
  print_instructions
  print_who_goes_first
=end

require "./board.rb"
require "./player.rb"
require "./computer.rb"

class Game
  def initialize
    print_instructions
    @board = Board.new
    @player1 = Player.create_player("X", "Player 1")
    @player2 = Player.create_player("O", "Player 2")
    @current_player = [@player1, @player2].sample
  end

  def play
    print_who_goes_first
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
    puts
  end

  def print_who_goes_first
    puts "#{@current_player.name} wins the toss, and will go first."
    puts "Enter the number of the column (1-7) where you want to put your piece in."
  end
end

# Game object
g = Game.new
g.play
