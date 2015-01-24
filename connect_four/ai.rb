class AI
  attr_reader :player_id

  def initialize(player_id)
    @player_id = player_id
  end

  def pick_column
    (1..7).to_a.sample
  end
end