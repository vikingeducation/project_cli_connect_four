# player.rb

class Player
  attr_reader :name, :piece, :position

  def initialize(piece, position)
    @name = get_name(position)
    @piece = piece
    @position = position
  end

  def get_name(position)
    puts "#{position}, please enter your name:"
    gets.chomp
  end

  def move
    get_move
  end

  def self.create_player(piece, position)
    input = ""
    @piece = piece
    until %w[ human h computer c].include?(input)
      puts "Will #{position} be a computer or a human?"
      input = gets.chomp.downcase
    end

    if %w[ human h ].include?(input)
      Player.new(piece, position)
    else
      Computer.new(piece, position)
    end
  end

  private

  def get_move
    begin
      puts "#{name}, please place your next #{piece} by typing the number of the column and pressing enter"
      response = gets.chomp.to_i
    end until (1..7).include?(response)
    [response - 1, piece]
  end

  

end

