# player.rb

class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def move
    get_move
  end

  private

  def get_move
    begin
      puts 'Please enter your next move.'
      response = gets.chomp.to_i
    end until (1..7).include?(response)
    [response - 1, piece]
  end
end

