class Player

  def initialize(player_name, piece_type)
    @player_name = player_name
    @piece_type = piece_type

  end
  
  attr_reader :player_name, :piece_type

  def choose_column(column)
    Board.place(self.piece_type, column)
  end

end
