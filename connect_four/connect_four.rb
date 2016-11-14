class ConnectFour

  def initialize
    @board = Board.new
  end

  def play
    welcome_display
    against_player_or_computer?
    loop do
      @board.render
      @current_player.get_col_guessed
      break if game_over
      switch_players
      switch_peg_system
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
        @peg_system_one = PegSystem.new("@", @board)
        @peg_system_two = PegSystem.new("O", @board)
        @player_one = HumanPlayer.new("PLAYER ONE", "@" ,@board)
        @player_two = ComputerPlayer.new("COMPUTER", "O" ,@board, @peg_system_one, @peg_system_two)
        break
      when "U"
        @peg_system_one = PegSystem.new("@", @board)
        @peg_system_two = PegSystem.new("O", @board)
        @player_one = HumanPlayer.new("PLAYER ONE", "@" ,@board)
        @player_two = HumanPlayer.new("PLAYER TWO", "O" ,@board)
        break
      else
        puts "You have typed incorrect value. Please try again!"
      end
    end
    @current_player = @player_one
    @current_peg_system = @peg_system_one
  end

  def ask_for_player_or_computer
    puts
    puts "Please choose who would you like to play against with."
    puts "Please type 'U' to play against another User or 'C' to play against Computer."
    gets.strip.upcase
  end

  def is_there_winner?
    if @current_peg_system.winning_connected_four
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

  def switch_peg_system
    @current_peg_system == @peg_system_one ? @current_peg_system = @peg_system_two : @current_peg_system = @peg_system_one
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

  def get_col_guessed
    loop do
      col_guessed = ask_for_col_guessed.to_i
      if @board.is_valid_input?(col_guessed)
        if @board.can_drop_peg_here?(col_guessed)
          @board.add_pegs(col_guessed, peg_symbol)
          break
        end
      else
        puts "Please provide correct number of the column!"
      end
    end
  end

  def ask_for_col_guessed
    puts
    puts
    puts "#{@name}, Please type a number of the column you wish to drop your peg in #{@peg_symbol}"
    gets.strip.to_i
  end

end

#========================AI Pair Programmed

class ComputerPlayer
  attr_accessor :peg_symbol, :board, :name, :competitors_peg

  def initialize(name, peg_symbol, board, peg_system_competitor, peg_system_computer)
    @name = name
    @peg_symbol = peg_symbol
    @board = board
    @competitors_peg = competitors_peg
    @peg_system_competitor = peg_system_competitor
    @peg_system_computer = peg_system_computer
  end

  def get_col_guessed
    loop do
      puts "DBG: @peg_system_competitor.three_pegs_vertically? = #{@peg_system_competitor.three_pegs_vertically?.inspect}"
      puts "DBG: @peg_system_competitor.three_pegs_horizontally? = #{@peg_system_competitor.three_pegs_horizontally?.inspect}"
      puts "DBG: @peg_system_competitor.three_pegs_diagonally? = #{@peg_system_competitor.three_pegs_diagonally?.inspect}"
      col_guessed = @peg_system_computer.three_pegs_vertically? || @peg_system_computer.three_pegs_horizontally? || 
              @peg_system_computer.three_pegs_diagonally? || @peg_system_competitor.three_pegs_vertically? || 
              @peg_system_competitor.three_pegs_horizontally? || @peg_system_competitor.three_pegs_diagonally? || 
              rand(1..7)
      puts "DBG: col_guessed = #{col_guessed.inspect}"
      if @board.can_drop_peg_here?(col_guessed)
        @board.add_pegs(col_guessed, peg_symbol)
        break
      end
    end
  end

end

#===============PEG

class PegSystem

  def initialize(peg_symbol, board)
    @peg_symbol = peg_symbol
    @board = board
    @peg_peg_peg_peg =  [@peg_symbol, @peg_symbol, @peg_symbol, @peg_symbol]
    @peg_peg_peg_empty = [@peg_symbol, @peg_symbol, @peg_symbol, nil]
    @peg_peg_empty_peg = [@peg_symbol, @peg_symbol, nil, @peg_symbol]
    @peg_empty_peg_peg = [@peg_symbol, nil, @peg_symbol, @peg_symbol]
    @empty_peg_peg_peg = [nil, @peg_symbol, @peg_symbol, @peg_symbol]
  end

  def placed_combination_in_array(array, combination)
    0.upto(array.size - combination.size) do |position|
      if array[position...(position + combination.size)] == combination
        return position
      end
    end
    return nil
  end

  def board_rotated_90deg
    board_vertical = []
    6.times do |column|
      new_row = []
      @board.board.each {|row| new_row << row[column]}
      board_vertical << new_row
    end
    board_vertical
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

  def four_pegs_vertically?
    board_rotated_90deg.any? {|row| placed_combination_in_array(row, @peg_peg_peg_peg)}
  end

  def four_pegs_horizontally?
    @board.board.any? {|row| puts "DBG: row = #{row.inspect}"; placed_combination_in_array(row, @peg_peg_peg_peg) != nil}
  end

  def four_pegs_diagonally?
    north_east_diagonals_array.any? {|row| placed_combination_in_array(row, @peg_peg_peg_peg)}||
    south_east_diagonals_array.any? {|row| placed_combination_in_array(row, @peg_peg_peg_peg)}
  end

  def three_pegs_vertically?
    board_rotated_90deg.each_with_index do |col, col_idx|
      if placed_combination_in_array(col, @empty_peg_peg_peg) && col[0] == nil
        return col_idx + 1
      end
    end
    return nil
  end

  def three_pegs_horizontally?
    potential_guess = []
    @board.board.each_with_index do |row, row_idx|
      case
      when placed_combination_in_array(row, @peg_peg_peg_empty)
        potential_guess = [row_idx, placed_combination_in_array(row, @peg_peg_peg_empty) + 3]
      when placed_combination_in_array(row, @peg_peg_empty_peg)
        potential_guess = [row_idx, placed_combination_in_array(row, @peg_peg_empty_peg) + 2]
      when placed_combination_in_array(row, @peg_empty_peg_peg)
        potential_guess = [row_idx, placed_combination_in_array(row, @peg_empty_peg_peg) + 1]
      when placed_combination_in_array(row, @empty_peg_peg_peg)
        potential_guess = [row_idx, placed_combination_in_array(row, @empty_peg_peg_peg)]
      end
      space_under_slot?(potential_guess) ? (break) : potential_guess = []
    end
    potential_guess.any? ? potential_guess[1] + 1 : nil
  end

  def space_under_slot?(coord)
    if coord.any?
      row_beneath = coord[0]
      puts "DBG: @board.slot_empty?(row_beneath + 1,coord[1] + 1)  = #{@board.slot_empty?(row_beneath + 1,coord[1] + 1) .inspect}"
      row_beneath < 5 ? !@board.slot_empty?(row_beneath + 1,coord[1] + 1) : true
    end
  end

  def shift_se_diagonal_to_get_board_coord(row_idx)
    case row_idx
    when 0
      [2,0]
    when 1
      [1,0]
    when 2
      [0,0]
    when 3
      [0,1]
    when 4
      [0,2]
    when 5
      [0,3]
    end
  end

  def three_pegs_south_east_diagonally?
    potential_guess = []
    south_east_diagonals_array.each_with_index do |row, row_idx|
      x = shift_se_diagonal_to_get_board_coord(row_idx)[0]
      y = shift_se_diagonal_to_get_board_coord(row_idx)[1]
      case
      when placed_combination_in_array(row, @peg_peg_peg_empty)
        potential_guess = [placed_combination_in_array(row, @peg_peg_peg_empty) + 3 + x, placed_combination_in_array(row, @peg_peg_peg_empty) + 3 + y]
      when placed_combination_in_array(row, @peg_peg_empty_peg)
        potential_guess = [placed_combination_in_array(row, @peg_peg_empty_peg) + 2 + x, placed_combination_in_array(row, @peg_peg_empty_peg) + 2 + y]
      when placed_combination_in_array(row, @peg_empty_peg_peg)
        potential_guess = [placed_combination_in_array(row, @peg_empty_peg_peg) + 1 + x, placed_combination_in_array(row, @peg_empty_peg_peg) + 1 + y]
      when placed_combination_in_array(row, @empty_peg_peg_peg)
        potential_guess = [placed_combination_in_array(row, @empty_peg_peg_peg) + x, placed_combination_in_array(row, @empty_peg_peg_peg) + y]
      end
      puts "DBG: potential_guess - se = #{potential_guess.inspect}"
      space_under_slot?(potential_guess) ? (break) : potential_guess = []
    end
    potential_guess.any? && !@board.board[0][potential_guess[1]] ? potential_guess[1] + 1 : nil
  end

  def shift_ne_diagonal_to_get_board_coord(row_idx)
    case row_idx
    when 0
      [-3,0]
    when 1
      [-4,0]
    when 2
      [-5, 0]
    when 3
      [-5, 1]
    when 4
      [-5, 2]
    when 5
      [-5, 3]
    end
  end

  def three_pegs_north_east_diagonally?
    potential_guess = []
    north_east_diagonals_array.each_with_index do |row, row_idx|
      x = shift_ne_diagonal_to_get_board_coord(row_idx)[0]
      y = shift_ne_diagonal_to_get_board_coord(row_idx)[1]
      case
      when placed_combination_in_array(row, @peg_peg_peg_empty)
        potential_guess = [placed_combination_in_array(row, @peg_peg_peg_empty) - (3 + x), placed_combination_in_array(row, @peg_peg_peg_empty) + 3 + y]
      when placed_combination_in_array(row, @peg_peg_empty_peg)
        potential_guess = [placed_combination_in_array(row, @peg_peg_empty_peg) - (2 + x), placed_combination_in_array(row, @peg_peg_empty_peg) + 2 + y]
      when placed_combination_in_array(row, @peg_empty_peg_peg)
        potential_guess = [placed_combination_in_array(row, @peg_empty_peg_peg) - (1 + x), placed_combination_in_array(row, @peg_empty_peg_peg) + 1 + y]
      when placed_combination_in_array(row, @empty_peg_peg_peg)
        potential_guess = [placed_combination_in_array(row, @empty_peg_peg_peg) - x, placed_combination_in_array(row, @empty_peg_peg_peg) + y]
      end
      puts "DBG: potential_guess - ne = #{potential_guess.inspect}"
      space_under_slot?(potential_guess) ? (break) : potential_guess = []
    end
    potential_guess.any? && !@board.board[0][potential_guess[1]] ? potential_guess[1] + 1 : nil
  end

  def three_pegs_diagonally?
    three_pegs_north_east_diagonally?  || three_pegs_south_east_diagonally?
  end

  def winning_connected_four
    four_pegs_horizontally? ||
    four_pegs_vertically? ||
    four_pegs_diagonally?
  end

end



#============================BOARD

class Board
  attr_reader :board

  def initialize
    #  @board = Array.new(6){Array.new(7)}
    @board = [[nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil], [nil, "O", nil, nil, nil, nil, nil], [nil, "O", "@", "@", "O", nil, nil], [nil, "@", "@", "O", "@", "O", nil], ["@", "@", "O", "@", "O", "O", nil]]
  end

  def render
    puts "DBG: @board = #{@board.inspect}"
    puts
    @board.size.times do |row|
      print "1 2 3 4 5 6 7 \n" if row == 0
      @board[row].size.times do |col|
        @board[row][col].nil? ? print("_|") : print("#{@board[row][col]}|")
      end
      puts
    end
      puts
  end

  def is_board_full?
    !@board.any? {|row| row.include? nil}
  end

  def add_pegs(col_guessed, peg_symbol)
    col = col_guessed - 1
    5.downto(0) do |row|
      if @board[row][col].nil?
        @board[row][col] = peg_symbol
        break
      end
    end
  end

  def within_board_range?(row, col_guessed)
    row <= 5 && col_guessed <= 6
  end

  def slot_empty?(row, col)
     true if within_board_range?(row, col) && @board[row][col - 1] == nil
  end

  def can_drop_peg_here?(col_guessed)
    self.slot_empty?(0, col_guessed - 1) ? true : puts("Please choose a different column, this one is full!")
  end

  def is_valid_input?(col_guessed)
    "1234567".include? col_guessed.to_s
  end

end

s = ConnectFour.new
s.play
