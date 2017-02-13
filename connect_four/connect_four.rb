# ------------------------------------------------------------
# Task
# ------------------------------------------------------------

# Your task is to build a command line Connect Four game. It should start
# with two players and render the board to the Command Line between turns.
# The board does not need to look pretty, just give enough information so
# you know its layout.

# You should validate user inputs and determine victory/loss/draw as
# dictated by the rules.

# ------------------------------------------------------------
# code
# ------------------------------------------------------------

# 2 players [ok]
# render board between turns
# prompt input
# validate user input
# win?
# lose?

# win: get 4 checkers of their color positioned either horizontally,
# diagonally, or vertically in a line

class ConnectFour
  attr_accessor :board, :player1, :player2

  def initialize
    @board = []
    @player1 = {}
    @player2 = {}
  end

  # ------------------------------------------
  # Set Up
  # ------------------------------------------

  def intro
    info = [
      "\n",
      "*** New Game ***",
      "The rules are:",
      "Players will take turns inserting their pieces in a given column ",
      "until 4 checkers of their color are positioned either horizontally, ",
      "diagonally, or vertically in a line"
    ]
    info.each { |msg| puts msg }
  end

  def prompt_names
    puts
    puts "Insert your names so we can begin:"
    print "Player 1 > "
    player1[:name] = gets.chomp
    print "Player 2 > "
    player2[:name] = gets.chomp
  end

  # ------------------------------------------
  # Board
  # ------------------------------------------

  def render
    puts "Board:"
    board.each { |row| puts row.to_s }
  end

  # ------------------------------------------
  # Game logic
  # ------------------------------------------

  def get_moves
  end

  # ------------------------------------------
  # Main
  # ------------------------------------------

  def run_game
    render
  end

  def play
    intro
    # prompt_names
    run_game
  end

end

cf = ConnectFour.new
cf.play
