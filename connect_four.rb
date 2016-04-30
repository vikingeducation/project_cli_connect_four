class Game

  def initialize(num_of_players=1)
    @player1 = Player.new("X")
    @board = Board.new

    if num_of_players == 1
      @player2 = Computer.new("O")
    else
      @player2 = Player.new("O")
    end

    @current_player = @player1
  end

  def play
    until over?

      @board.render

      check_move(@current_player.get_move)

      #check_win

      #check_full_board

      switch_player

    end
  end

  def check_move(move)
    puts move
    if move > 7 || move < 1
      puts "Invalid move! It is out of bounds."
      check_move(@current_player.get_move)
    elsif @board.columns[move].length == 7
      puts "Invalid move! Column #{move} is full."
      check_move(@current_player.get_move)
    else
      @board.columns[move] << @current_player.piece
    end
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def over?
    false
  end

end

class Player

  attr_reader :piece

  def initialize(piece)
    @piece = piece
  end

  def get_move
    puts "Enter 1-6 to make a move."
    move = gets.chomp
    return move.to_i
  end

end

class Computer

  def initialize(piece)
    @piece = piece
  end

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
