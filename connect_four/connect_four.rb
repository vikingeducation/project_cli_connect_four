
class Game

  def initialize
    welcome
    play
  end

  def play
    until win?
      @player1.ask_move
      @player2.ask_move
      [@player1, @player2].each_with_index do |player, index| 
        @board.add_piece(player, index)
      end
    end
  end

  def welcome
    puts "Welcome to Connect Four?"
    @board = Board.new
    ask_mode
    set_players
  end

  def ask_mode
    puts "How many players? [one, two]"
    @mode = gets.chomp == 'one' ? :computer : :human
  end

  def set_players
    case @mode
    when :human
      puts "Enter Player 1's name."
      @player1 = Player.new(gets.chomp)
      puts "Enter Player 2's name."
      @player = Player.new(gets.chomp)
    when :computer
      puts "Enter Player 1's name."
      @player1 = Player.new(gets.chomp)
      #set computer
      @player2 = Player.new(:computer)
    end
  end

  def win?
    @board.any_winning_rows?
    @board.any_winning_cols?
    @board.any_winning_diagonals?
  end

end

class Board

  def initialize
    @state = [
      ["o","o","o","o"],
      ["o","o","o","o"],
      ["o","o","o","o"],
      ["o","o","o","o"]
    ]
  end

  def get_col(col)
    return_array = []
    @state.each do |row|
      return_array.push(row[col])
    end
    return_array
  end

  # Handles the adding of pieces
  def add_piece(col, type)
    @state.reverse_each do |row|
      unless peg_present(col, row)
        insert_peg(col, row, type)
        break
      end
    end
  end

  # Inserts a type into a supplied row at col
  def insert_peg(col, row, type)
    row[col] = convert_type(type)
  end

  # Converts player's index to type
  def convert_type(type)
    type == 0 ? '=' : '+'
  end

  #Check if peg already present.
  def peg_present(col,row)
    row[col] == '+' || row[col] == '='
  end

  def winning_combination?(combination)
    if combination.all? { |peg| peg == "+" } || combination.all? { |peg| peg == "=" }
      return true
    end
  end

  #Winning conditionals
  def any_winning_rows?
    @state.each do |row|
      winning_combination? row
    end
  end

  def any_winning_cols?
    (0..@state.first.length).each do |i|
      winning_combination? get_col(i)
    end
  end

  def any_winning_diagonals?
    diagonal_1 = [@state[0][0],
                  @state[1][1],
                  @state[2][2],
                  @state[3][3]]
    diagonal_2 = [@state[0][3],
                  @state[1][2],
                  @state[2][1],
                  @state[3][0]]
    winning_combination?(diagonal_1) || winning_combination?(diagonal_2)
  end

end

class Player
  attr_reader :move
  def initialize(name)
    case name
    when String
      @name = name
      @mode = :human
    when Symbol
      @mode = :computer
    end
  end

  def ask_move
    case @move
    when :human
      puts "Which column would you like to place your peg in?"
      gets.chomp.to_i - 1
    when :computer
      (0..3).sample
    end
  end

end


def test
  Game.new
end

test