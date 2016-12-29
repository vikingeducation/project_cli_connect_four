class Player
  attr_reader :name, :color
  attr_accessor :turn

  # def intiialize(color: , name: , )
  #  @name  = name;

  def initialize(attributes)
    @name = attributes[:name]
    @color = attributes[:color]
    @turn = attributes[:turn]
  end

  private

  def determine_valid_moves(board_data)
    valid_moves = []
    board_data[5].each_with_index do |column, column_index|
      valid_moves << (column_index+1).to_s if column == 0
    end
    valid_moves
  end
end