require_relative "player"
require_relative "board"


class ConnectFour

  attr_reader :board, :current_player, :name

  def initialize 
    @player1 = Player.new(:X)
    @player2 = Player.new(:O)
    @board = Board.new
    @current_player = @player1
  end

  def play
    until board_full?
      announce_player
      @current_player.move
      until !col_full?(@current_player.column)
        puts "Column is full!  Pick another column!"
        @current_player.move 
      end
      move_piece(@current_player.column)
      puts"Here is the current board!:"
      @board.display_board
      if @board.horizontal_win?(@current_player.piece, @current_player.column) ||
       @board.vertical_win?(@current_player.piece, @current_player.column) || 
       @board.diagonal_win?(@current_player.piece, @current_player.column)
        announce_winner
        if play_again?
          c = ConnectFour.new
          c.play
        else
          exit
        end
      end
      switch_players
    end 
  end

  def play_again?
    response = nil
    until response == "y" || response == "n"
      puts "Do you want to play again? Enter 'y' or 'n'"
      response = gets.chomp
    end
    response == "y"
  end

  def announce_winner
    if @current_player == @player1
      puts "You win, Player 1!"
    else
      puts "You win, Player 2!"
    end
  end

  def announce_player
    if @current_player == @player1
      puts "Player 1's turn:"
    else
      puts "Player 2's turn:"
    end
  end

  def move_piece(col)
    row = @board.board.length - @board.board.map { |row| row[col] }.compact.length - 1
    @board.board[row][col] = @current_player.piece            
  end

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def col_full?(col)
    @board.board[0][col] != nil
  end

  def board_full? 
    @board.board[0].all? { |i| i != nil }
  end

end

c = ConnectFour.new
c.play


