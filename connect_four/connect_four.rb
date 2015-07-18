# Your code here!
#go for the glory
#go for the score
#go for it
#connect four


#a board seven wide and 6 high
#each column is a stack that can only be pushed onto
#rejects move if stack is already 6
require './connect_four_player.rb'
require './connect_four_ai.rb'


class ConnectFour
  def initialize(game_type)
    @board = Board.new
    @player1 = Player.new(@board, "\u{2686}")
    game_type ==1 ? @player2 = ConnectFourAI.new(@board, "\u{2688}") : @player2 = Player.new(@board, "\u{2688}")
  end

  def play
    player = @player1

    loop do
      @board.render
      player.move
      player = swap_players(player)

      break if connect_four? || draw?
    end

    game_over(player)
  end

  def swap_players(player)
    player == @player1 ? @player2 : @player1
  end

  def connect_four?
    @board.check_victory
  end

  def draw?
    @board.check_draw?
  end

  def game_over(player)
    @board.render
    puts "Ay, yo, Game Over"
    puts player == @player1 ? "Player 2 wins!" : "Player 1 wins!"
    exit
  end
end

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new }
  end

  def check_victory
    vertical_check || horizontal_check || diagonal_up_check || diagonal_down_check
  end

  def vertical_check
    result=true
    0.upto(3) do |i|
     result = false unless (@board[@last_move][-1-i]  == @board[@last_move][-1])
    end
    result
  end

  def horizontal_check
    result = true
    color = @board[@last_move][-1]
    row = @board[@last_move].length-1
    same_count = 0
    (0..6).each do |i|
      if @board[i][row] == color
        same_count += 1
        return true if same_count == 4
      else
        same_count=0
      end
    end
    false
  end


  def diagonal_up_check
    (0..6).each do |column|
      (0..5).each do |row|
        color = @board[column][row]
        break unless @board[column+3] && @board[column+3][row+3]
        return true if @board[column+1][row+1] == color && @board[column+2][row+2] == color && @board[column+3][row+3] == color
      end
    end
    false
  end

  def diagonal_down_check
    (0..6).each do |column|
      (0..5).each do |row|
        color = @board[column][row]
        break unless @board[column-3] && @board[column-3][row+3]
        return true if @board[column-1][row+1] == color && @board[column-2][row+2] == color && @board[column-3][row+3] == color
      end
    end
    false
  end

  def check_draw?
    @board.all? {|i| i.length == 6}
  end

  def valid_move?(column, color)
    (0..6).include?(column) && @board[column].length < 6
  end

  def add_piece(column, color)
    @last_move = column
    @board[column] << color
  end

  def render
    5.downto(0) do |row|
      0.upto(6) do |column|
        if @board[column][row]
          print "| #{@board[column][row]} "
        else
          print "|   "
        end
      end
      puts "|\n"
      puts "-" * 29
    end
    print "  "
    0.upto(6) {|i| print i.to_s.ljust(4)}

    puts "\n\n"
  end

end
