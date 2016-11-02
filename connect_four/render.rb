class Render
  def self.board(board)
    rows = []
    board.map! do |column|
      6.times do |i|
        column[i] || column << " "
      end
      column
    end
    5.downto(0) do |i|
      rows << []
      board.each do |column|
        rows[-1] << column[i]
      end
    end
    rows.each { |row| p row}
  end
end