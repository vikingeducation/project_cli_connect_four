class Game
  def initialize
    @view = View.new
    @board = Board.new
    set_up_game
    play
  end

  def set_up_game
    set_view_board
    @view.welcome_message
    @mode = @view.ask_for_mode
    set_players
  end

  def set_view_board
    @view.board = @board
  end

  def play
    until @board.win?
      @player1.make_move
      @player2.make_move
      @board.render
    end
    @board.render
    set_winner
    @view.end_message(@winner)
  end

  def set_winner
    @winner = find_player_by_symbol(@board.winner_symbol)
    @board.winner = @winner
  end

  def find_player_by_symbol(symbol)
    @player1.symbol == symbol ? @player1 : @player2
  end

  def set_players
    @player1 = Human.new('=' , @view, @board)
    puts "Mode is #{@mode}"
    case @mode
    when :computer
      @player2 = Computer.new('+', @view, @board)
    when :human
      @player2 = Human.new('+', @view, @board)
    end
  end
end

class Player
  attr_reader :symbol, :name
  def initialize(symbol, view, board)
    @symbol = symbol
    @view = view
    @board = board
    set_name
  end
end

class Human < Player

  def initialize(symbol, view, board)
    super(symbol, view, board)
  end

  def set_name
    @name = @view.ask_for_name
  end

  def make_move
    move = get_appropriate_move
    @board.add_disc(move, @symbol)
  end

  def get_appropriate_move
    move = nil
    until @board.possible_col?(move)
      move = @view.ask_for_col(@name) - 1
    end
    move
  end
end

class Computer < Player
  def initialize(symbol, view, board)
    super(symbol, view, board)
  end

  def set_name
    @name = "Computer"
  end

  def make_move
    @board.add_disc(rand(7), @symbol)
  end
end

class View
  attr_accessor :board

  def end_message(winner)
    if winner.is_a?(Computer)
      write_out("The computer wins...")
    else
      write_out("Congratulations #{@board.winner.name}, you win!")
    end
    nil
  end

  def ask_for_col(entity = nil)
    write_out("Which column would you like to place your disc in, #{entity}?")
    get_input.to_i
  end

  def welcome_message
    write_out("Welcome to Connect Four!")
  end

  def ask_for_name(entity = nil)
    if entity
      write_out("And what is your name, #{entity}?")
    else
      write_out("And what is your name?")
    end
    get_input.to_s
  end

  def write_out(output)
    puts output
  end

  def get_input
    gets.chomp
  end

  def ask_for_mode
    modes = %w(one two)
    input = nil
    until modes.include?(input)
      write_out("How many players? [one, two]")
      input = get_input
    end
    input.to_sym == :one ? :computer : :human
  end
end


class Board
  attr_reader :winner_symbol
  attr_accessor :winner
  def initialize(state = new_game_board)
    @state = state
  end

  def win?
    any_horizontal_wins? ||
    any_vertical_wins?   ||
    any_diagonal_wins?
  end

  def any_horizontal_wins?
    @state.each { |row| return true if row_contains_horizontal_wins?(row) }
    false
  end

  def any_vertical_wins?
    @state.transpose.each do |row|
      return true if row_contains_horizontal_wins?(row)
    end
    false
  end

  def any_diagonal_wins?
    @state.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        combination = find_se_diag_by_row_col(row_index, col_index)
        return true if winning_combination?(combination)
      end
    end
    false
  end

  def find_se_diag_by_row_col(row, col)
    positions = [ [row,col], [(row+1),(col+1)], [(row+2),(col+2)], [(row+3),(col+3)] ]
    positions.map do |position|
      row, col = position[0], position[1]
      if possible_col?(col) && possible_row?(row)
        @state[row][col]
      else
        nil
      end
    end
  end

  def row_contains_horizontal_wins?(row)
    4.times do |iter|
      next unless possible_row?(iter+3)
      combination = row[iter..(iter+3)]
      return true if winning_combination?(combination)
    end
    false
  end

  def winning_combination?(combination)
    if combination.all? { |disc| disc == "=" }
      @winner_symbol = "="
      true
    elsif combination.all? { |disc| disc == "+" }
      @winner_symbol = "+"
      true
    else
      false
    end
  end

  def possible_row?(row_num)
    row_num > -1 && row_num < 6
  end

  def possible_col?(col_num)
    return false if col_num.nil?
    col_num > -1 && col_num < 7
  end

  def render
    @state.each do |row|
      p row
    end
    puts
  end

  # Handles the adding of discs
  def add_disc(col, type)
    @state.reverse_each do |row|
      unless disc_present(col, row)
        insert_disc(col, row, type)
        break
      end
    end
  end

  # Inserts a type into a supplied row at col
  def insert_disc(col, row, type)
    row[col] = convert_type(type)
  end

  # Converts from := or :+ symbols to matching strings
  def convert_type(disc)
    disc.to_s
  end

  #Check if disc already present.
  def disc_present(col,row)
    row[col] == '+' || row[col] == '='
  end

  def new_game_board
    [
      ["o","o","o","o","o","o"],
      ["o","o","o","o","o","o"],
      ["o","o","o","o","o","o"],
      ["o","o","o","o","o","o"],
      ["o","o","o","o","o","o"],
      ["o","o","o","o","o","o"]
    ]
  end
end

def test_game_board
  [
    ["o","o","o","o","o","o"],
    ["o","o","o","o","o","o"],
    ["=","o","o","o","o","o"],
    ["=","o","o","o","o","o"],
    ["=","o","o","o","o","o"],
    ["=","o","o","o","o","o"]
  ]
end
