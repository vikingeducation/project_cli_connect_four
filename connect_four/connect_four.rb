require_relative 'board.rb' 
require_relative 'player.rb' 
require_relative 'human.rb' 
require_relative 'computer.rb'

class ConnectFour

  def initialize
    @board = Board.new
    @board.setup
    @player_1 = nil
    @player_2 = nil
  end

  def play_connect_four
    display_instructions
    color_prompt
    opponent_prompt(@player_1.color)
    player = @player_1

    until @board.win? || @board.draw? do
      @board.render

      puts "It is #{player.color}'s turn"
      if player.add_piece(player.select_move, @board)
        player = switch_player(player)
      else
        next
      end
    end
    puts "Congratulations, you win!"
  end

  def display_instructions

  end

  def color_prompt
    puts "Please select a color, R for red and B for black: "
    color = gets.chomp.upcase
    @player_1 = Human.new(color)
  end

  def opponent_prompt(color)
    puts "Please select your opponent (type 1 for human, 2 for computer): "
    opponent = gets.chomp
    if opponent == "1" || opponent == "2"
      opponent == "1" ? @player_2 = Human.new(opponent_color(color)) : @player_2 = Computer.new(opponent_color(color))
    end
  end

  def opponent_color(color)
    color == "B" ? "R" : "B"
  end

  def switch_player(player)
    player == @player_1 ? player = @player_2 : player = @player_1
  end
  

end

game = ConnectFour.new

game.play_connect_four