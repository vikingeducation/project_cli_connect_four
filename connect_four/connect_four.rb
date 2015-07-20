class ConnectFour
  attr_accessor :player1, :player2, :current_player

  def initialize

    @board = Board.new

  end

  def welcome
    puts "----------------------------------------"
    puts "Welcome to Connect Four"
    puts "Choose between 1 and 7 when dropping a disk"
    puts "----------------------------------------"
  end

  def play
    welcome

    create_players(choose_game_type)

    @current_player = @player1

    loop do
      @board.render

      @current_player.get_move

      break if game_over?
      switch_player
    end
    @board.render
    display_result
    #ask_for_play_again
  end

  def choose_game_type
    puts "Would you like to play (1) against the computer or (2) against another player?"
    input = gets.chomp.to_i
    until [1,2].include?(input)
      puts "Your input is not valid. Try typing 1 or 2"
      input = gets.chomp.to_i
    end
    input
  end

  def create_players(choice)

    if choice == 1
      @player1 = Human.new("Player 1", :x, @board)
      @player2 = AI.new("Computer", :o, @board)
    else
      @player1 = Human.new("Player 1", :x, @board)
      @player2 = Human.new("Player 2", :o, @board)
    end

  end

  def game_over?
    @board.check_victory? || @board.full?
  end

  def switch_player

    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end

  end

  def display_result

    if @board.full?
      puts "Draw!"
    else
      puts "#{@current_player.name} wins!"
    end

  end

  # def ask_for_play_again

  #   puts "Do you want to play again? (y/n)"

  #   input = gets.chomp.downcase

  #   until ["y", "n"].include?(input)
  #     puts "Your input is not valid. Try typing y or n"
  #     input = gets.chomp.downcase
  #   end

  #   play if input == "y"

  # end

end



class Board
  attr_reader  :game_board

  def initialize(game_board = nil)
    
    @game_board = game_board
    @game_board ||= Array.new(7) { Array.new(6) { :- } }

  end

  def render
    puts
    puts "1  2  3  4  5  6  7"
    puts "==================="

    @game_board.transpose.each do |l| 
      l.each {|e| print "#{e}  "}
      puts
    end

    puts "==================="
    puts "1  2  3  4  5  6  7"
    puts
  end

  def add_piece(column, piece)

    if @game_board[column-1][0] == :-
      @game_board[column-1].length.downto(0) do |i|
        if @game_board[column-1][i] == :-
          @game_board[column-1][i] = piece 
          break
        end
      end
      return true
    else
      puts "This column is full, you can not add more pieces in it."
    end

  end

  def full?

    @game_board.each do |col|
      return false if col.include?(:-)
    end

    return true

  end

  def check_victory?(game_board = @game_board)

    check_vertical?(game_board) || 
    check_horizontal?(game_board) || 
    check_diagonal?(game_board)

  end

  def check_vertical?(board)

    board.each do |column|

      num_consec = 0

      current = column[0]

      column.each_with_index do |element, i|

        if element == :-
          num_consec = 0
          current = column[i+1]
          next
        end

        if element == current
          num_consec += 1
          return true if num_consec >= 4
        else
          num_consec = 1
          current = element
        end

      end
    end
    return false
  end

  def check_horizontal?(board)

    check_vertical?(board.transpose)

  end

  def check_diagonal?(board)

    check_diagonal_helper(board, 1) || 
    check_diagonal_helper(board, -1)

  end



  def check_diagonal_helper(board, step)

    #p board

    (0..6).each do |c|

      (0..5).each do |r|

        current = board[c][r]

        num_consec = 0

        col = c

        row = r

        6.times do

          if board[col][row] == :-
            num_consec = 0
            current = board[col+1][row+step] if (0..6).include?(col+1) && (0..5).include?(row+step)
          elsif board[col][row] == current
            num_consec += 1
            #puts num_consec
            return true if num_consec >= 4
          else
            num_consec = 1
            current = board[col][row]
          end

          col += 1
          row += step

          break if col >= 7 || row >= 6 || col < 0 || row < 0

        end
      end
    end
    return false
  end

end

class Player
  attr_reader :name

  def initialize(name, piece, board)

    @name = name

    @piece = piece

    @board = board

  end

end

class Human < Player

  def get_move

    print "#{@name}, which column would you like to drop your disk? "

    loop do

      column = ask_for_column

      if format_valid?(column)

        break if @board.add_piece(column, @piece)

      end
    end

  end

  private 


  def ask_for_column

    gets.chomp.to_i

  end



  def format_valid?(column)

    if (1..7).include?(column)
      return true
    else
      puts "The number you input must be between 1 and 7."
    end

  end


end


class AI < Player

  def get_move

    loop do

      break if @board.add_piece(generate_move, @piece)

    end
  end

  def generate_move

    # check if there is a possible winning move
    (1..7).each do |column|

      board_copy = []

      @board.game_board.each { |col| board_copy << col.dup }

      if test_piece(column, @piece, board_copy)

        if @board.check_victory?(board_copy)
          return column
        end

      end

    end

    # check if the other player has a possible 
    # winning move and block it
    (1..7).each do |column|

      board_copy = []

      @board.game_board.each { |col| board_copy << col.dup }

      if test_piece(column, :x, board_copy)

        if @board.check_victory?(board_copy)
          return column
        end

      end

    end

    # otherwise return a random move
    return rand(1..7)

  end

  def test_piece(column, piece, test_board)

    if test_board[column-1][0] == :-
      test_board[column-1].length.downto(0) do |i|
        if test_board[column-1][i] == :-
          test_board[column-1][i] = piece
          break
        end
      end
      return true
    else
      return false
    end

  end



end

