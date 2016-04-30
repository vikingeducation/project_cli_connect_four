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

  def play
    until game.over?

      @board.render

      #@current_player.get_move

      #check_win

      #check_full_board

      #switch_player

    end
  end

end

class Player

end

class Computer

end

class Board

  attr_reader :columns

  def initialize
    @columns = (1..6).each_with_object({}) { |num, col| col[num] = [] }
  end

  def render
    6.downto(0) do |num|
      print "|#{@columns[1][num]}\t|"
      print "#{@columns[2][num]}\t|"
      print "#{@columns[3][num]}\t|"
      print "#{@columns[4][num]}\t|"
      print "#{@columns[5][num]}\t|"
      print "#{@columns[6][num]}\t|\n"
    end
  end

end

puts "Welcome to Connect 4!\n1 or 2 Players?"
num_of_players = gets.chomp
game = Game.new(num_of_players.to_i)
game.play
