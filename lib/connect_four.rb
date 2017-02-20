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
      player2: {name: "p2", piece: "o"},
      game_mode: nil
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

  def game_mode
    puts "\nSingle-player (1) or Multi-player (2)?"
    print "\n[1/2] > "
    app_state[:game_mode] = gets.strip.to_i
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
      app_state[:board].each_with_index do |row, i|
        print "#{i+1} "
        row.each do |cell|
          cell.nil? ? print(" - ") : print(" " + cell.to_s + " ")
        end
        puts
      end
      print "  "
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

  def within_valid_coordinates?(move)
    if move >= 0 && move <= 6
      true
    else
      puts "Piece coordinate out of bounds"
    end
  end

  def coordinates_available?(move)
    if app_state[:board].any?{ |row| row[move].nil? }
      true
    else
      puts "This column is already filled"
    end
  end

  def valid_move?(move)
    within_valid_coordinates?(move) &&
    coordinates_available?(move)
  end

  def prompt_move(player)
    if app_state[:game_mode] == 1 && player[:name] == "p2"
      rand(0..6)
    else
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

  def horizontals
    (0..5).reduce([]) do |horizontals, row|
      horizontals << (0..6).reduce([]) do |acc_row, col|
        acc_row << app_state[:board][row][col]
      end
    end
  end

  def diagonals(l)
    h, w = l.length, l[0].length
    (0...(h + w - 1)).reduce([]) do |acc, p|
      acc << ([p-h+1, 0].max...[p+1, w].min).reduce([]) do |partial, q|
        partial << l[h - p + q - 1][q]
      end
    end
  end

  def antidiagonals(l)
    h, w = l.length, l[0].length
    (0...(h + w - 1)).reduce([]) do |acc, p|
      acc << ([p-h+1, 0].max...[p+1, w].min).reduce([]) do |partial, q|
        partial << l[p - q][q]
      end
    end
  end

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

  def winning_diagonal?(piece)
    board = app_state[:board]
    result = false
    (diagonals(board) + antidiagonals(board)).each do |diag|
      previous, in_a_row = nil, 0
      diag.each do |cell|
        unless cell.nil?
          if previous.nil?
            previous, in_a_row = cell, 1
            next
          elsif cell == piece && previous == piece
            in_a_row += 1
          else
            previous, in_a_row = cell, 1
          end
        end
        result = true if in_a_row == 4
      end
    end
    result
  end


  def winning_horizontal?(piece)
    result, previous = false, nil
    horizontals.each do |horz|
      in_a_row = 0
      horz.each do |cell|
        result = true if in_a_row == 4
        unless cell.nil?
          if previous.nil?
            previous, in_a_row = cell, 1
            next
          elsif cell == piece && previous == piece
            in_a_row += 1
          else
            previous, in_a_row = cell, 1
          end
        end
      end
    end
    result
  end

  def winning_combination?(piece)
    winning_diagonal?(piece) ||
    winning_horizontal?(piece) ||
    winning_vertical?(piece)
  end

  def board_full?
    app_state[:board].all? do |row|
      row.none?(&:nil?)
    end
  end

  def check_game_over(current_player)
    if winning_combination?(current_player[:piece])
      puts "Congratulations #{current_player[:name]}, you win!"
      true
    elsif board_full?
      puts "\nDraw!"
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
    game_mode
    # prompt_names
    run_game
  end

end

cf = ConnectFour.new
cf.play
