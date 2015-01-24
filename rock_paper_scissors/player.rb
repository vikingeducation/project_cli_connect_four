class Player
  attr_accessor :choice
  attr_reader :player_id

  def initialize(player_id)
    @player_id = player_id
  end

  def move
    self.choice = nil
    until valid_input?
      print "Player #{player_id}, choose rock ('R'), paper ('P') or scissors ('S')\n > "
      self.choice = gets.chomp.upcase
      unless valid_input?
        print "That's not an allowed move!\n"
      end
    end
    self.choice
  end

  def valid_input?
    ["R","P","S"].include? self.choice
  end
end