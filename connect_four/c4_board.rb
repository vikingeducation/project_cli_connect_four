class ConnectFourBoard
  attr_accessor :board
  def initialize
    @board = build_empty_game_array
  end

  def render
    board.each do |row|
      row.each do |slot|
        print slot + ' '
      end
      puts
    end
  end

  private

  def build_empty_game_array(board_height = 6, board_width = 7)
    Array.new(board_height) { Array.new(board_width) { |_i| _i = '-' } }
  end
end
