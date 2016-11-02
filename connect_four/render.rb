class Render
  def self.board(board)
    board.map! do |column|
      6.times do |i|
        column[i] || column << nil
      end
      column
    end
    p board
  end
end