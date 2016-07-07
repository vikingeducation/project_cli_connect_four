class Player
  att_reader :name

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def take_turn
    #loop
      # ask player for column number get_column
      column = get_column
      # validate input
      # if valid, add piece
  end

  private
    def input_valid?(input)
      (1..7) === input.to_i
    end

end