class ConnectFour

  def initialize
    @board = Board.new
    @player_one = Player.new("Player One", "X", @board)
    @player_two = Player.new("Player Two", "O", @board)

    @board.render

    @current_player = @player_one
  end


  def play

    loop do
      @current_player.select_column
      next_player if @current_player.piece == @board.last_piece
      @board.render
    end
  end


  def next_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end


end




class Board
  attr_reader :last_piece

  def initialize
    # 7col x 6row array
    @gameboard = Array.new(7) { Array.new(6) { "_" } }
  end


  def render
    5.downto(0) do |row|
      print " "
      0.upto(6) do |col|
        print "| #{@gameboard[col][row]} "
      end
      print "| \n"
    end
  end


  def try_column(column_number, player_piece)

    if @gameboard[column_number][5] == "_"
      place_piece(column_number, player_piece)
    else
      puts "Column is full!  Please try again."
    end

  end


  def place_piece(column, piece)
    #push to lowest index currently open
    0.upto(5) do |row|
      if @gameboard[column][row] == "_"
        @gameboard[column][row] = piece
        break
      end
    end
    @last_piece = piece
  end

end





class Player
  #attr_accessor :piece

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end


  def select_column
    user_input = nil

    loop do
      puts "#{@name}, select a column to drop into: (1 - 7)"
      user_input = gets.chomp
      if valid_integer?(user_input) && valid_range?(user_input)
        break
      else
        puts "Invalid input - please try again."
      end
    end

    @board.try_column(user_input.to_i - 1, @piece)
  end


  def valid_integer?(input)
    input.to_f == input.to_i
  end


  def valid_range?(input)
    input.to_i.between?(1, 7)
  end




end

game = ConnectFour.new
game.play