
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
    #message
    @board = Board.new
    ask_mode
    set_players
  end

  def set_players
    case @mode
    when :human
      #enter name
      @player1 = Player.new(gets.chomp)
      #enter name
      @player = Player.new(gets.chomp)
    when :computer
      #enter name
      @player1 = Player.new(gets.chomp)
      #set computer
      @player2 = Player.new(:computer)
    end
  end

  def win?
  end

end

class Board

  def initialize
    @state = [
      [o,o,o,o],
      [o,o,o,o],
      [o,o,o,o],
      [o,o,o,o]
    ]
  end

  def get_row(player_input)
    @state[player_input-1]    
  end

  def get_col(player_input)
    return_array = []
    @state.each do |row|
      return_array.push(row[player_input-1])
    end
    return_array
  end

  # Handles the adding of pieces
  def add_piece(col, type)
    @state.reverse_each do |row|
      insert_peg(col, row, type) unless peg_present(col, row)
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
    puts "Which column would you like to place your peg in?"
    gets.chomp.to_i - 1
  end

end
