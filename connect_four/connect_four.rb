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
# render board between turns [ok]
# prompt input
# validate user input
# win?
# lose?

# win: get 4 checkers of their color positioned either horizontally,
# diagonally, or vertically in a line

class ConnectFour
  attr_accessor :app_state

  def initialize
    @app_state = {
      board: Array.new(6) { Array.new(7) },
      player1: {name: "p1", piece: "x"},
      player2: {name: "p2", piece: "o"}
    }
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
      "diagonally, or vertically in a line",
      "Moves are the number of the column, from 1 to 7, i.e forth column: 4"
    ]
    info.each { |msg| puts msg }
  end

  def prompt_names
    puts
    puts "Insert your names so we can begin:"
    print "Player 1 > "
    app_state[:player1][:name] = gets.chomp
    print "Player 1 pieces > "
    app_state[:player1][:piece] = gets.chomp
    print "Player 2 > "
    app_state[:player2][:name] = gets.chomp
    print "Player 2 pieces > "
    app_state[:player2][:piece] = gets.chomp
  end

  # ------------------------------------------
  # Board
  # ------------------------------------------

  def render
    unless app_state[:board].empty?
      puts
      app_state[:board].each do |row|
        row.each do |cell|
          cell.nil? ? print(" - ") : print(" " + cell.to_s + " ")
        end
        puts
      end
      (1..7).each{ |i| print " #{i} "}
      puts
    end
  end

  # ------------------------------------------
  # Move
  # ------------------------------------------

  def sanitize_move(move)
    move.strip.to_i - 1
  end


  def valid_move?(move)
    move >= 0 && move <= 6
  end

  def prompt_move(player)
    print "\n#{player[:name]} move > "
    move = gets
    move = sanitize_move(move)
    unless valid_move?(move)
      puts "Please insert a valid move"
      prompt_move(player)
    else
      move
    end
  end

  def place_move(player, move)
    5.downto(0).each do |row|
      if app_state[:board][row][move].nil?
        app_state[:board][row][move] = player[:piece]
        break
      end
    end
  end

  # ------------------------------------------
  # Board
  # ------------------------------------------



  # ------------------------------------------
  # Winning conditions
  # ------------------------------------------

  def winning_vertical?(piece)
    result, previous = false, nil
    # loop cols 0..6
    (0..6).each do |col|
      in_a_row = 0
      # loop rows 5..0
      5.downto(0).each do |row|
        result = true if in_a_row == 4
        cell = app_state[:board][row][col]
        unless cell.nil?
          if previous.nil?
            previous = cell
            in_a_row += 1
            next
          elsif cell == piece && previous == piece
            in_a_row += 1
          else
            previous = cell
          end
        end
      end
    end
    result
  end

  def horizontals
    horizontals = []
    6.times do |i|
      horizontals << [@board[0][i],@board[1][i],@board[2][i]]
    end
    horizontals
  end

  def winning_combination?(piece)
    # todo: winning_diagonal?(piece) ||
    #winning_horizontal?(piece) ||
    winning_vertical?(piece)
  end

  def check_game_over(current_player)
    if winning_combination?(current_player[:piece])
      puts "Congratulations #{current_player[:name]}, you win!"
      true
    else
      false
    end
  end

  # ------------------------------------------
  # Main
  # ------------------------------------------

  def run_game
    game_over = [app_state[:player1], app_state[:player2]].reduce(false) do |win, player|
      render
      move = prompt_move(player)
      place_move(player, move)
      return true if check_game_over(player)
      false
    end
    return if game_over
    run_game
  end

  def play
    intro
    # prompt_names
    run_game
  end

end

cf = ConnectFour.new
cf.play
