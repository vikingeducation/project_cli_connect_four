class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def take_turn
      column = get_column
  end

  def info
    puts "My name is #{name}  and I have #{piece} pieces!"
  end

  def to(other_player)
    @name = other_player.name
    @piece = other_player.piece
  end

  def equals?(other_player)
    @name == other_player.name && @piece == other_player.piece
  end
end