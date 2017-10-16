class ConnectFour

  def initialize
    @board = Board.new
  end

  def play
    welcome_display
    against_player_or_computer?
    loop do
      @board.render
      @current_player.get_guess
      break if game_over
      switch_players
    end
    @board.render
  end

  private

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
   puts "This game is similar to the classic tic-tac-toe game."
   puts "The primary difference is that players must connect four of their pegs in a straight line"
   puts "either horizontally, vertically or diagonally."
   puts
   puts "The player takes turns with the other player or computer to drop pegs into slots within the grid."
   puts "The first one to connect four slots in a line wins."
   puts "The player drops his peg into chosen column. The pegs falls into next available position."
   puts
   puts
  end

  def against_player_or_computer?
    loop do
      case ask_for_player_or_computer
      when "C"
        @player_one = HumanPlayer.new("PLAYER ONE", "@" ,@board)
        @player_two = ComputerPlayer.new("COMPUTER", "O" ,@board, "@")
        break
      when "U"
        @player_one = HumanPlayer.new("PLAYER ONE", "@" ,@board)
        @player_two = HumanPlayer.new("PLAYER TWO", "O" ,@board)
        break
      else
        puts "You have typed incorrect value. Please try again!"
      end
    end
    @current_player = @player_one
  end

  def ask_for_player_or_computer
    puts
    puts "Please choose who would you like to play against with."
    puts "Please type 'U' to play against another User or 'C' to play against Computer."
    gets.strip.upcase
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

#========================AI Pair Programmed

class ComputerPlayer
  attr_accessor :peg_symbol, :board, :name, :competitors_peg

  def initialize(name, peg_symbol, board, competitors_peg)
    @name = name
    @peg_symbol = peg_symbol
    @board = board
    @competitors_peg = competitors_peg
  end

  def get_guess
    loop do
      guess = is_it_winning_vertical?(@peg_symbol) || is_it_winning_horizontal?(@peg_symbol) || 
              is_it_winning_diagonal?(@peg_symbol) || is_it_winning_vertical?(@competitors_peg) || 
              is_it_winning_horizontal?(@competitors_peg) || is_it_winning_diagonal?(@competitors_peg) || 
              rand(1..7)
      if @board.is_peg_location_available?(guess)
        @board.add_pegs(guess, peg_symbol)
        break
      end
    end
  end

  def array_include_other_array_in_order?(main_array, minor_array)
    0.upto(main_array.size - minor_array.size) do |position|
      if main_array[position...position + minor_array.size] == minor_array
        return position
      end
    end
    return nil
  end


  def board_of_columns_in_rows
    board_vertical = []
    6.times do |column|
      new_row = []
      @board.board.each {|row| new_row << row[column]}
      board_vertical << new_row
    end
    board_vertical
  end

  def is_it_winning_vertical?(peg_symbol)
    board_of_columns_in_rows.each_with_index do |col, col_idx|
      if array_include_other_array_in_order?(col, [nil, peg_symbol, peg_symbol, peg_symbol]) && col[0] == nil
        return col_idx + 1
      end
    end
    return nil
  end

  def space_underneath_peg_position?(coord_array)
    if coord_array.any?
      row_beneath = coord_array[0]
      row_beneath < 5 ? @board.board[row_beneath + 1][coord_array[1]] : true
    end
  end


  def is_it_winning_horizontal?(peg_symbol)
    guess_coordinates = []
    @board.board.each_with_index do |row, row_idx|
      case
      when array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, peg_symbol, nil])
        guess_coordinates = [row_idx, array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, peg_symbol, nil]) + 3]
      when array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, nil, peg_symbol])
        guess_coordinates = [row_idx, array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, nil, peg_symbol]) + 2]
      when array_include_other_array_in_order?(row, [peg_symbol, nil, peg_symbol, peg_symbol])
        guess_coordinates = [row_idx, array_include_other_array_in_order?(row, [peg_symbol, nil, peg_symbol, peg_symbol]) + 1]
      when array_include_other_array_in_order?(row, [nil, peg_symbol, peg_symbol, peg_symbol])
        guess_coordinates = [row_idx, array_include_other_array_in_order?(row, [nil, peg_symbol, peg_symbol, peg_symbol])]
      end
      if space_underneath_peg_position?(guess_coordinates)
        break
      else
        guess_coordinates = []
      end
    end
    guess_coordinates.any? ? guess_coordinates[1] + 1 : nil
  end

  def south_east_diagonals_array
    se_diagonals = Array.new(6){Array.new}
       0.upto(5) do |diag|
        se_diagonals[0] << @board.board[2 + diag][diag] if diag <= 3
        se_diagonals[1] << @board.board[1 + diag][diag] if diag <= 4
        se_diagonals[2] << @board.board[diag][diag]
        se_diagonals[3] << @board.board[diag][1 + diag]
        se_diagonals[4] << @board.board[diag][2 + diag] if diag <= 4
        se_diagonals[5] << @board.board[diag][3 + diag] if diag <= 3
      end
      se_diagonals
  end

  def north_east_diagonals_array
    ne_diagonals = Array.new(6){Array.new}
    5.downto(0) do |diag|
      ne_diagonals[0] << @board.board[diag - 2][5 - diag]
      ne_diagonals[1] << @board.board[diag - 1][5 - diag]
      ne_diagonals[2] << @board.board[diag][5 - diag]
      ne_diagonals[3] << @board.board[diag][6 - diag]
      ne_diagonals[4] << @board.board[diag][7 - diag] if diag >= 1
      ne_diagonals[5] << @board.board[diag][8 - diag] if diag >= 2
    end
    ne_diagonals
  end


  def is_it_winning_south_east_diagonal?(peg_symbol)
    guess_coordinates = []
    x, y = 0, 0
    south_east_diagonals_array.each_with_index do |row, row_idx|
      case row_idx
      when 0
        x = 2
        y = 0
      when 1
        x = 1
        y = 0
      when 2
        x = 0
        y = 0
      when 3
        x = 0
        y = 1
      when 4
        x = 0
        y = 2
      when 5
        x = 0
        y = 3
      end

      case
      when array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, peg_symbol, nil])
        guess_coordinates = [array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, peg_symbol, nil]) + 3 + x, array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, peg_symbol, nil]) + 3 + y]
      when array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, nil, peg_symbol])
        guess_coordinates = [array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, nil, peg_symbol]) + 2 + x, array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, nil, peg_symbol]) + 2 + y]
      when array_include_other_array_in_order?(row, [peg_symbol, nil, peg_symbol, peg_symbol])
        guess_coordinates = [array_include_other_array_in_order?(row, [peg_symbol, nil, peg_symbol, peg_symbol]) + 1 + x, array_include_other_array_in_order?(row, [peg_symbol, nil, peg_symbol, peg_symbol]) + 1 + y]
      when array_include_other_array_in_order?(row, [nil, peg_symbol, peg_symbol, peg_symbol])
        guess_coordinates = [array_include_other_array_in_order?(row, [nil, peg_symbol, peg_symbol, peg_symbol]) + x, array_include_other_array_in_order?(row, [nil, peg_symbol, peg_symbol, peg_symbol]) + y]
      end
      puts "DBG: guess_coordinates_se = #{guess_coordinates.inspect}"
      if space_underneath_peg_position?(guess_coordinates) && guess_coordinates.any?
        break
      else
        guess_coordinates = []
      end
    end
    puts "DBG: guess_coordinates_se_after checking peg landing = #{guess_coordinates.inspect}"
    guess_coordinates.any? && !@board.board[0][guess_coordinates[1]] ? guess_coordinates[1] + 1 : nil
  end

  def is_it_winning_north_east_diagonal?(peg_symbol) #DIAGONALLY [x,y]
    guess_coordinates = []
    x, y = 0, 0
    north_east_diagonals_array.each_with_index do |row, row_idx|
      case row_idx
      when 0
        x = -3
        y = 0
      when 1
        x =  -4
        y = 0
      when 2
        x =  -5
        y = 0
      when 3
        x = -5
        y = 1
      when 4
        x = -5
        y = 2
      when 5
        x =  -5
        y = 3
      end

      case
      when array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, peg_symbol, nil])
        guess_coordinates = [array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, peg_symbol, nil]) + (3 + x)*(-1), array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, peg_symbol, nil]) + 3 + y]
      when array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, nil, peg_symbol])
        guess_coordinates = [array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, nil, peg_symbol]) + (2 + x)*(-1), array_include_other_array_in_order?(row, [peg_symbol, peg_symbol, nil, peg_symbol]) + 2 + y]
      when array_include_other_array_in_order?(row, [peg_symbol, nil, peg_symbol, peg_symbol])
        guess_coordinates = [array_include_other_array_in_order?(row, [peg_symbol, nil, peg_symbol, peg_symbol]) + (1 + x)*(-1), array_include_other_array_in_order?(row, [peg_symbol, nil, peg_symbol, peg_symbol]) + 1 + y]
      when array_include_other_array_in_order?(row, [nil, peg_symbol, peg_symbol, peg_symbol])
        guess_coordinates = [array_include_other_array_in_order?(row, [nil, peg_symbol, peg_symbol, peg_symbol]) + x*(-1), array_include_other_array_in_order?(row, [nil, peg_symbol, peg_symbol, peg_symbol]) + y]
      end
      puts "DBG: guess_coordinates_ne = #{guess_coordinates.inspect}"
      if space_underneath_peg_position?(guess_coordinates) && guess_coordinates.any?
        break
      else
        guess_coordinates = []
      end
    end
    puts "DBG: guess_coordinates-before the final answer = #{guess_coordinates.inspect}"
    guess_coordinates.any? && !@board.board[0][guess_coordinates[1]] ? guess_coordinates[1] + 1 : nil
  end

  def is_it_winning_diagonal?(peg_symbol)
    is_it_winning_north_east_diagonal?(peg_symbol)  || is_it_winning_south_east_diagonal?(peg_symbol)
  end


end

#============================================

class Board
  attr_reader :board

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
      puts
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
    if @board.first[guess-1].nil?
      true
    else
      puts "Please choose different column, this one is full!"
    end
  end

  def is_valid_input?(guess)
    "1234567".include? guess.to_s
  end

  def winning_connected_four(peg_symbol)
    is_it_winning_horizontal?(peg_symbol) ||
    is_it_winning_diagonal?(peg_symbol) ||
    is_it_winning_vertical?(peg_symbol)
  end


  private

  def board_of_rows_strings
    @board.map { |row| row = row.join(",") }
  end

  def is_it_winning_horizontal?(peg_symbol)
    four = four_pegs_connected(peg_symbol)
    board_of_rows_strings.any? {|row| row.include? four}
  end

  def is_it_winning_diagonal?(peg_symbol)
    north_east_diagonals_array.any? {|row| row.include? four_pegs_connected(peg_symbol)} ||
    south_east_diagonals_array.any? {|row| row.include? four_pegs_connected(peg_symbol)}
  end

  def is_it_winning_vertical?(peg_symbol)
    board_of_columns_strings.any? {|row| row.include? four_pegs_connected(peg_symbol)}
  end

  def four_pegs_connected(peg_symbol)
    "#{peg_symbol},#{peg_symbol},#{peg_symbol},#{peg_symbol}"
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

  def south_east_diagonals_array
    se_diagonals = Array.new(6){Array.new}
       0.upto(5) do |diag|
        se_diagonals[0] << @board[diag][diag]
        se_diagonals[1] << @board[1 + diag][diag] if diag <= 4
        se_diagonals[2] << @board[2 + diag][diag] if diag <= 3
        se_diagonals[3] << @board[diag][1 + diag]
        se_diagonals[4] << @board[diag][2 + diag]
        se_diagonals[5] << @board[diag][3 + diag]
      end
    se_diagonals.map { |row| row = row.join(",") }
  end

  def north_east_diagonals_array
    ne_diagonals = Array.new(6){Array.new}
    5.downto(0) do |diag|
      ne_diagonals[0] << @board[diag][5 - diag]
      ne_diagonals[1] << @board[diag][6 - diag]
      ne_diagonals[2] << @board[diag][7 - diag]
      ne_diagonals[3] << @board[diag][8 - diag]
      ne_diagonals[4] << @board[diag - 1][5 - diag]
      ne_diagonals[5] << @board[diag - 2][5 - diag]
    end
    ne_diagonals.map { |row| row = row.join(",") }
  end

end

s = ConnectFour.new
s.play
