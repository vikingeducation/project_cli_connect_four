class Player

  attr_reader :move

  def initialize(color)
    @color = color
    @move = {col:nil, color:@color}
  end
end