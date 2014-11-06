class ConnectFour

  def initialize
    @board = Board.new
    @player1 = Player.new(@board,"x")
    @player2 = Player.new(@board,"o")
  end

  def play
    turn=0
      loop do
      @board.render
      @player1.make_move
      turn +=1
      break if @board.check_win
      @player2.make_move
      turn += 1
      break if @board.check_win
    end
    @board.render
    puts "game over"
    puts turn.even? ? "Player 2 wins" : "Player 1 wins"
  end

end

class Player

  def initialize(board, piece)
    @board = board
    @piece = piece
  end

  def make_move
      @board.render
      puts "Please choose a column to drop your piece"
      move = gets.strip.to_i
      if @board.is_valid?(move)
        @board.place_piece(move, @piece)
      else
        puts "make another move"
        make_move
      end
  end

end

class Board

  def initialize
    @board = Array.new(7){Array.new}
  end

  def render
    print "\n"
    @board.each do |column|
      print column 
      print "\n"
    end
    print "\n"
  end

  def check_win
    horizontal || vertical || search_diagonal || search_other_diagonal || check_draw
  end

  def place_piece(move, piece)
    @board[move-1] << piece
  end

  def is_valid?(move)
    if (0..6).include?(move-1) && @board[move-1].length < 7
      return true
    else
      return false
    end
  end
  
  def horizontal #actual rows
    horiz = []
    (0..6).each do |column|
      (0..6).each do |row|
        horiz << @board[row][column]
        horiz << "b" if @board[row][column] == nil
      end
    horiz << "b"
    end
    check_four(horiz)
  end

  def vertical #actual COLUMNS
    vertical = []
    @board.each do |column|
      column.each do |piece|
        vertical << "b" if piece == nil
        vertical << piece
      end
    vertical << "b"
    end
    check_four(vertical)
  end

  def check_four(arg)
    %w(xxxx oooo).any?{|str| arg.join.include? str}
  end

  def search_diagonal
    diagonal = []
    (0..6).each do |column|
      (0..6).each do |row|
        (0..6).each do |diag|
          unless @board[column+diag].nil?
            if @board[column+diag][row+diag].nil?
              diagonal << "b"
            else
            diagonal << @board[column+diag][row+diag]
            end
          end
        end
      end
    end
    check_four(diagonal)
  end

  def search_other_diagonal
    diagonal = []
    (0..6).each do |column|
      (0..6).each do |row|
        (0..6).each do |diag|
          unless @board[column+diag].nil?
            if @board[column-diag][row+diag].nil?
              diagonal << "b"
            else
            diagonal << @board[column+diag][row+diag]
            end
          end
        end
      end
    end
    check_four(diagonal)
  end

  def check_draw
    @board.each do |column|
      if column.length >= 7
        return true
      else
        return false
        break
      end
    end
  end
  
end

t = ConnectFour.new
t.play