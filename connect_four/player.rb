class Player
  attr_reader :player_id

  def initialize(player_id)
    @player_id = player_id
  end

  def pick_column
    print "Player #{player_id.upcase}, choose a column for your coin.\n > "
    return gets.chomp.to_i
  end
end