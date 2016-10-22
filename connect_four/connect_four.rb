require 'pry'

class ConnectFour

  def initialize
    @board = Board.new
    @player_one = HumanPlayer.new("PLAYER ONE", "@" ,@board)
    @player_two = HumanPlayer.new("PLAYER TWO", "O" ,@board)
    @current_player = @player_one
  end

  def play
    welcome_display
    loop do
      @board.render
      @current_player.get_guess
      break if game_over
      switch_players
    end
  end

  def welcome_display
    puts "
    ____                            _     _____
   / ___|___  _ __  _ __   ___  ___| |_  |  ___|__  _   _ _ __
  | |   / _ \\| '_ \\| '_ \\ / _ \\/ __| __| | |_ / _ \\| | | | '__|
  | |__| (_) | | | | | | |  __/ (__| |_  |  _| (_) | |_| | |
   \\____\\___/|_| |_|_| |_|\\___|\\___|\\__| |_|  \\___/ \\__,_|_|"
   puts
   puts
   puts "ABOUT THE GAME"
   puts "This game is similar to the classic tic-tac-toe game, the primary difference being that in this game players must connect four of their pegs in a straight line, either horizontally, vertically or diagonally."
   puts "The player takes turns with the other player or computer to drop pegs into slots within the grid. The first one to connect four slots in a line wins."
   puts "The player drops his peg into chosen column. The pegs falls into next available position."
   puts
   puts
  end

  def is_there_winner?
    if @board.winning_connected_four(@current_player.peg_symbol)
      puts "Congratulations to #{@current_player.name}!!! You have connected four symbol pegs!"
      true
    else
      false
    end
  end

  def is_there_draw?
    if @board.is_board_full?
      puts "There is no winner this time!"
      true
    else
      false
    end
  end

  def game_over
    is_there_draw? || is_there_winner?
  end

  def switch_players
    @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
  end

end

class HumanPlayer
  attr_accessor :peg_symbol, :board, :name

  def initialize(name, peg_symbol ,board)
    raise "Peg has to be a string" unless peg_symbol.is_a? (String)
    @name = name
    @peg_symbol = peg_symbol
    @board = board
  end

  def get_guess
    loop do
      guess = ask_for_guess.to_i
      if @board.is_valid_input?(guess)
        if @board.is_peg_location_available?(guess)
          @board.add_pegs(guess, peg_symbol)
          break
        end
      else
        puts "Please provide correct number of the column!"
      end
    end
  end

  def ask_for_guess
    puts
    puts
    puts "#{@name}, Please type a number of the column you wish to drop your peg in #{@peg_symbol}"
    gets.strip.to_i
  end

end

class Board

  def initialize
    @board = Array.new(6){Array.new(7)}
  end

  def render
    puts
    @board.size.times do |row|
      print "1 2 3 4 5 6 7 \n" if row == 0
      @board[row].size.times do |col|
        if @board[row][col].nil?
          print "_|"
        else
          print "#{@board[row][col]}|"
        end
      end
      puts
    end
      print "_____________________"
  end

  def is_board_full?
    !@board.any? {|row| row.include? nil} # if true the board is not full
  end

  def add_pegs(guess, peg_symbol)
    col = guess - 1
    5.downto(0) do |row|
      if @board[row][col].nil?
        @board[row][col] = peg_symbol
        break
      end
    end
  end

  def is_peg_location_available?(guess)
    if @board.first[guess].nil?
      true
    else
      puts "Please choose different column, this one is full!"
    end
  end

  def is_valid_input?(guess)
    "1234567".include? guess.to_s
  end

  def board_of_rows_strings
    @board.map { |row| row = row.join(",") }
  end

  def is_it_winning_horizontal?(peg_symbol)
    four = four_pegs_connected(peg_symbol)
    board_of_rows_strings.any? {|row| row.include? four}
  end

  def is_it_winning_diagonal?(peg_symbol)
    north_east_diagonals.any? {|row| row.include? four_pegs_connected(peg_symbol)} ||
    north_west_diagonals.any? {|row| row.include? four_pegs_connected(peg_symbol)}
  end

  def is_it_winning_vertical?(peg_symbol)
    board_of_columns_strings.any? {|row| row.include? four_pegs_connected(peg_symbol)}
  end

  def four_pegs_connected(peg_symbol)
    "#{peg_symbol},#{peg_symbol},#{peg_symbol},#{peg_symbol}"
  end

  def winning_connected_four(peg_symbol)
    is_it_winning_horizontal?(peg_symbol) ||
    is_it_winning_diagonal?(peg_symbol) ||
    is_it_winning_vertical?(peg_symbol)
  end

  def board_of_columns_strings
    board_vertical = []
    6.times do |column|
      new_row = []
      @board.each {|row| new_row << row[column]}
      board_vertical << new_row
    end
    board_vertical.map { |row| row = row.join(",") }
  end

  def north_east_diagonals
    ne_diagonals = Array.new(6){Array.new}
      0.upto(5) do |diag|
        ne_diagonals[0] << @board[0+diag][diag]
        ne_diagonals[1] << @board[1+diag][diag] if 1 + diag < 6
        ne_diagonals[2] << @board[2+diag][diag] if 2 + diag < 6
        ne_diagonals[3] << @board[diag][1+diag]
        ne_diagonals[4] << @board[diag][2+diag]
        ne_diagonals[5] << @board[diag][3+diag]
      end
    ne_diagonals.map { |row| row = row.join(",") }
  end

  def north_west_diagonals
    nw_diagonals = Array.new(6){Array.new}
    0.upto(5) do |diag|
      nw_diagonals[0] << @board[diag][4 + diag]
      nw_diagonals[1] << @board[diag][5 + diag] if 6 + diag < 7
      nw_diagonals[2] << @board[diag][6 + diag] if 6 + diag < 7
      nw_diagonals[3] << @board[4 + diag][diag] if 4 + diag < 6
      nw_diagonals[4] << @board[5 + diag][diag] if 5 + diag < 6
      nw_diagonals[5] << @board[6 + diag][diag] if 6 + diag < 6
    end
    nw_diagonals.map { |row| row = row.join(",") }
  end

end

s = ConnectFour.new
s.play
