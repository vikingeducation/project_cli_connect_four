class Board
  attr_reader :board
  def initialize
    @board = Array.new(7) { [nil,nil,nil,nil,nil,nil] }
  end

  def add_piece(column, piece)
    board[column]  << piece if board[column].length < 7
  end

  def winner?
  end

  def win
    check_horizontal
  end

  def check_horizontal(piece)
    horizontal = @board.transpose
    horizontal.each do |row|
      # Create counter
      # scan line
      # increment counter if match
      # 
      #
      counter = 0
      row.each_with_index(1) do |item, index| 
        if item == row[index-1]
          counter += 1
        else
          counter = 0
        end
      end

    end
  end

  def scan_board
    board.each do |column|
      5.downto(0) do |i|
        yield(column[i])
      end
    end
  end

  def full?
    scan_board do |item|
      return false if !item
    end
    true
  end
end