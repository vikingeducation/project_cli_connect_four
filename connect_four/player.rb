# player.rb

=begin
Class: Player
  name      # attr_reader
  piece     # attr_reader
  get_name
  move

  class method:
  create_player

  private:
  get_move
=end

class Player
  attr_reader :name, :piece

  def initialize(piece)
    @name = get_name
    @piece = piece
  end

  def get_name
    puts "Please enter your name:"
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
      Player.new(piece)
    else
      Computer.new(piece)
    end
  end

  private

  def get_move
    begin
      puts "Please place your next #{piece}, #{name}"
      response = gets.chomp.to_i
    end until (1..7).include?(response)
    [response - 1, piece]
  end

  

end

