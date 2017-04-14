# /connect_four.rb
class Game
  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
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
      break if game_over?
      puts "it worked"
      break
    end
  end

  def game_over?
    false
  end
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
    puts board_setup.to_s
    # dummy board
    (0..6).each do |x|
      i = 1
      (0..6).each do |y|
        @board_setup[x][y] = i
        i += 1
      end
    end
    puts board_setup.to_s
  end

end

class Player
  # initialize
  def initialize
    @piece = ""
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

  def select_row(input)
    #
  end

  private

  # val_piece
  def val_piece(input)
    # Checks to see if input for piece value is valid
    input.is_a?(Integer) || input.length > 1 ? false : true
  end
  # select_row
end

g = Game.new
g.play
