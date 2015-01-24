require './board.rb'
require './player.rb'
require './ai.rb'

class ConnectFour
  attr_reader :board, :player_x, :player_o

  def initialize
    @board = Board.new
    puts "\n WELCOME to CONNECT FOUR"
    puts "One player or two?"
    number_of_players = gets.chomp.to_i # validation?
    @player_x = Player.new("x")

    if number_of_players == 1
      puts "HAL engaged"
      @player_o = AI.new("o")
    else
      @player_o = Player.new("o")
    end

    loop do
      turn player_x
      turn player_o
    end
  end

  def turn(current_player)
    board.render
    column = nil
    until board.insert_coin column, current_player.player_id
      column = (current_player.pick_column - 1)
    end
    game_over_sequence(current_player.player_id)
  end

  def game_over?
    board.full? || board.win?
  end

  def game_over_sequence(player_id)
    if game_over?
      if board.win?
        puts "Congratulations, Player #{player_id.upcase}! You won!"
      else
        puts "Sorry, this game is a draw"
      end
      board.render
      exit
    end
  end
end