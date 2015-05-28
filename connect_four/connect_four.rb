class ConnectFour

  def initialize
    @board = Board.new
    @player_one = Player.new("Player One", "X", @board)

    puts "Play against AI? (y/n)"
    if gets.chomp.downcase == "y"
      @player_two = AIPlayer.new("CPU", "O", @board)
    else
      @player_two = Player.new("Player Two", "O", @board)
    end

    @board.render

    @current_player = @player_one
    @turn_count = 1
  end


  def play

    loop do
      @current_player.select_column
      next_player if @current_player.piece == @board.last_piece
      @board.render
      @board.win_conditions
      break if @board.winner != nil || @turn_count > 42
    end

    if @board.winner.nil?
      puts "The game is a draw. You should probably play again..."
    else
      puts "Winner: #{@board.winner}!!!"
    end

  end


  def next_player
    @turn_count += 1
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end


end




class Board
  attr_reader :last_piece, :winner

  def initialize
    # 7col x 6row array
    @gameboard = Array.new(7) { Array.new(6) { "_" } }
  end


  def render
    system("clear")
    print "\n"
    5.downto(0) do |row|
      print " "
      0.upto(6) do |col|
        print "| #{@gameboard[col][row]} "
      end
      print "| \n"
    end
    print " "
    7.times { |index| print "|~#{index + 1}~"}
    print "| \n\n"
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


  def win_conditions
    win_horizontal
    win_vertical
    win_diagonals
    @winner
  end


  def win_horizontal
    0.upto(5) do |row|
      test_string = String.new

      0.upto(6) do |col|
        test_string << @gameboard[col][row]
      end

      @winner = "Player One" if test_string.include?("XXXX") #why can't I put @player_one.name here???
      @winner = "Player Two" if test_string.include?("OOOO")
    end
  end


  def win_vertical
    @gameboard.each do |column|
      @winner = "Player One" if column.join("").include?("XXXX")
      @winner = "Player Two" if column.join("").include?("OOOO")
    end
  end


  def win_diagonals
    # starting in cols 0 to 3
    0.upto(3) do |col|

      #starting in rows 0 to 2
      0.upto(2) do |row|
        test_string = String.new

        4.times do |index|
          test_string << @gameboard[col + index][row + index]
        end

        @winner = "Player One" if test_string.include?("XXXX")
        @winner = "Player Two" if test_string.include?("OOOO")
      end

      #starting in rows 5 to 3
      5.downto(3) do |row|
        test_string = String.new

        4.times do |index|
          test_string << @gameboard[col + index][row - index]
        end

        @winner = "Player One" if test_string.include?("XXXX")
        @winner = "Player Two" if test_string.include?("OOOO")
      end
    end
  end

end





class Player
  attr_reader :piece

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

class AIPlayer < Player

  def select_column
    user_input = rand(0..6)
    @board.try_column(user_input, @piece)
  end

end




game = ConnectFour.new
game.play