# Your code here!
#go for the glory
#go for the score
#go for it
#connect four


#a board seven wide and 6 high
#each column is a stack that can only be pushed onto
#rejects move if stack is already 6

class ConnectFour
  def initialize
    @board = Board.new
    @player1 = Player.new(@board, "\u{2686}")
    @player2 = Player.new(@board, "\u{2688}")
  end

  def play
    player = @player1

    loop do
      @board.render
      player = swap_players(player)
      player.move

      break if connect_four? || draw?
    end

    game_over
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

  def game_over
    @board.render
    puts "Ay, yo, Game Over"
  end
end

class Board
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
    @board.each { |column| p column }
  end

end

class Player
  def initialize(board, color)
    @board = board
    @color = color
  end

  def move
    column = nil
    loop do
      column = get_move
      break if @board.valid_move?(column, @color)
    end
    @board.add_piece(column, @color)
  end

  def get_move
    puts "Enter a column to play your piece (0-6): "
    move = gets.chomp.to_i
  end

end

c4 = ConnectFour.new
c4.play
