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

end

class Game

  def initialize
    welcome
    play
  end

  def play
    until win?
      @player1.ask_move
      @player2.ask_move
    end
  end

  def welcome
    #message
    ask_mode
    set_players
    set_board
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

  #create Board instance. set as ivar?
  def set_board
  end

  def win?
  end

end

class Player

  def initialize(name)
    case name
    when String
      @name = name
      @mode = :human
    when Symbol
      @mode = :computer
  end

end