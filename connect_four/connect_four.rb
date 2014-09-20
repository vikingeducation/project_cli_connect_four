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
    false
  end

  def draw?
    false
  end

  def game_over
  end
end

class Board
  def initialize
    @board = Array.new(7) { Array.new }
  end

  def valid_move?(column, color)
    (0..6).include?(column) && @board[column].length < 6
  end

  def add_piece(column, color)
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