class Player

  def initialize(player_name, piece_type)
    @piece_type = piece_type
    @player_name = player_name
  end

  def choose_column(column)
    Board.place(self.piece_type, column)
  end

end