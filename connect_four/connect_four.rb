require_relative "./board.rb"

class ConnectFour

  def initialize
    @board = Board.new
    print @board.grid
  end
end

game = ConnectFour.new

