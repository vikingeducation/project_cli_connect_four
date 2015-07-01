class Player

  def initialize(is_ai = false)
    @is_ai = is_ai
  end

  def get_move
    @is_ai? ai_move : human_move
  end

  def human_move
    puts "Input a move Col 1 to 6"
    col_to_add_to = gets.chomp.to_i
    col_to_add_to -= 1
    until col_to_add_to >= 0 && col_to_add_to < 6
      puts "Invalid column number, try again!"
    	col_to_add_to = self.human_move
    end
    col_to_add_to
  end

  # Algorithm for deciding the ai's move
  def ai_move
  	(0..5).to_a.sample
  end

end

# see if there is a winning move
# stop human if they are winning


class Game

  def initialize
    @players = []
  end

  # Main Game loop
  def play
    @board = Board.new
    instantiate_players # Are there two players or 1 vs ai?
    @turn = 0
    until(@board.winner || @board.full?)
      @board.move(get_valid_move)
      @board.display
      @turn += 1
    end
    @board.winner ? (puts "Player #{@board.winner + 1} wins!") : (puts "It's a draw!")

  end

  def current_player
    @players[@turn%2]
  end

  def get_valid_move
    puts "Turn #{@turn + 1}, Player #{(@turn % 2) + 1}"
  	col = current_player.get_move
  	if @board.col_full?(col)
      puts "That column is full."
      @board.display
      while @board.col_full?(col)
  		  col = current_player.get_move
        puts "That column is full."
        @board.display
      end
  	end
  	return col, @turn%2
  end

  def instantiate_players
    puts "How many players are there?"
    choice = gets.chomp
    if choice == "1"
      puts "Do you want to go first or second?"
      choice = gets.chomp
      if choice == "1"
        @players << Player.new
        @players << Player.new(true)
      else
        @players << Player.new(true)
        @players << Player.new
      end
    else
      @players << Player.new
      @players << Player.new
    end
  end

end

class Board

  def initialize
  	@state = [[],[],[],[],[],[]]
  end

  def move(args)
  	@state[args[0]] << args[1]
  end

  # Returns the winner, or NIL if there is no winner
  def winner
    # Horizontal
    0.upto(5) do |row|
      0.upto(2) do |col|
        if (@state[0 + col][row] == @state[1 + col][row]) &&
        (@state[0 + col][row] == @state[2 + col][row]) &&
        (@state[0 + col][row] == @state[3 + col][row])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end

    # Vertical
    0.upto(5) do |col|
      0.upto(2) do |row|
        if (@state[col][0 + row] == @state[col][1 + row]) &&
        	(@state[col][0 + row] == @state[col][2 + row]) &&
        	(@state[col][0 + row] == @state[col][3 + row])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end

    # Bottom left to upper right
    0.upto(2) do |row|
      0.upto(2) do |col|
        if (@state[col][row] == @state[1 + col][1 + row]) &&
        	(@state[col][row] == @state[2 + col][2 + row]) &&
        	(@state[col][row] == @state[3 + col][3 + row])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end

    # Upper left to lower right
    5.downto(3) do |row|
      0.upto(2) do |col|
        if (@state[col][row] == @state[col + 1][row - 1]) &&
        	(@state[col][row] == @state[col + 2][row - 2]) &&
        	(@state[col][row] == @state[col + 3][row - 3])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end

    return nil
  end

  def full?
    return @state.reduce(0){|acc, col| acc += col.length} == 36
  end

  def display
    puts ""
    puts ""
    5.downto(0) do |idx|
      0.upto(5) do |pos|
        @state[pos][idx]? (print "#{@state[pos][idx]}") : (print " ")
      end
      puts ""
    end
  end

  def col_full?(col_no)
  	@state[col_no].length > 5
  end
end

game = Game.new

game.play


=begin

check_win? logic
5  5  5  5  5  5
4  4  4  4  4  4
3  3  3  3  3  3
2  2  2  2  2  2
1  1  1  1  1  1
0  0  0  0  0  0
c0 c1 c2 c3 c4 c5

horiz
0.upto(5).times do |row]
  0.upto(2).times do |col|
    if board[0 + col][row] == board[1 + col][row] == board[2 + col][row] == board[3 + col][row]

vertical
0.upto(5).times do |col|
  0.upto(2).times do |row|
    if board[col][0 + row] == board[col][1 + row] == board[col][2 + row] == board[col][3 + row]
/
0.upto(2).times do |xpos|
  0.upto(2).times do |ypos|
    if board[ypos][xpos] == board[1 + ypos][1 + xpos] == board[2 + ypos][2 + xpos] == board[3+ypos][3+xpos]
0 0
  board[0][0] board [1][1] board [2][2] board[3][3]
0 1
  board[1][0] board [2][1] board [3][2] board[4][3]
0 2
  board[2][0] board [3][1] board [4][2] board[5][3]
2 2
  board[2][3] board [3][4] board [4][5] board[5][6]

\
5.downto(3).times do |row|
  0.upto(2).times do |col|
    if board[col][row] == board[col + 1][row - 1] == board[col + 2][row - 2] == board[col + 3][row - 3]

  def get(col, row)
    return board[col][row]
  end

1. class Input
  - get input (c1 thru c6)
  - def validate move
    - check_move?
    - does a simple numeric check
2. class Board
  - [[x,x,x,x,x,x], [x,x,x,x,x,x], [x,x,x,x,x,x], [x,x,x,x,x,x], [x,x,x,x,x,x], [x,x,x,x,x,x]]
  - def check_win?
    - horizontal wins
    - vertical wins
    - diagonal wins
  - def check_move?
    - if col is filled

=end