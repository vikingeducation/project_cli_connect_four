# player.rb

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

  private

  def get_move
    begin
      puts "Please enter your next move, #{name}"
      response = gets.chomp.to_i
    end until (1..7).include?(response)
    [response - 1, piece]
  end
end

