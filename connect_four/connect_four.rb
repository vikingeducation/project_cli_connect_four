# /connect_four.rb
class Game
  def initialize
    @board = Board.new
    @player1 = Player.new(@board)
    @player2 = Player.new(@board)
    @cur_player = @player1
  end
  # play
  def play
    # Identifies player piece designations
    puts "Player 1, select your symbol"
    # @player1.piece(gets.chomp)
    @player1.def_piece("#")
    puts "Player 2, select your symbol"
    # @player2.piece(gets.chomp)
    @player2.def_piece("&")
    loop do
      @board.render
      @cur_player.select_row(1)
      break if game_over?

      break
    end
  end

  def game_over?
    false
    puts "you win!"
  end

  # change_player
end

class Board
  def initialize
    @board_setup = Array.new(7, Array.new(7, "_"))
  end
  # board_setup
  def board_setup
    @board_setup
  end

  # render
  def render
    # dummy board
    # (0..6).each do |x|
    #   i = 1
    #   (0..6).each do |y|
    #     @board_setup[x][y] = i
    #     i += 1
    #   end
    # end
    # puts "This is my dummy board:"
    # puts board_setup.to_s
    (0..6).each do |y|
      output_str = "\n|"
      (0..6).each do |x|
         output_str << "  #{@board_setup[x][y]}  |"
      end
      puts output_str + "\n"
    end
    col_str = "\n|"
    (1..7).each {|n| col_str << "  #{n}  |"}
    puts col_str
  end
end

class Player
  # initialize
  def initialize(board)
    @piece = ""
    @board = board
  end

  def piece
    @piece
  end

  def def_piece(input)
    if val_piece(input)
      @piece = input
    else
      puts "please select a symbol or letter, (not a number)"
    end
  end

  # select_row
  def select_row(input)
    #
  end

  private

  # val_piece
  def val_piece(input)
    # Checks to see if input for piece value is valid
    input.is_a?(Integer) || input.length > 1 ? false : true
  end
end

g = Game.new
g.play
