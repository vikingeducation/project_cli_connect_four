class Board
  def initialize
    @board = Array.new(7, [])
  end

  # def add_to_col?(move)
  #   unless col_full?
  #     @board[move[:col]] << @player.move[:color]
  #   else
  #     false
  #   end
  # end

  def win?
    check_lines?
  end

  def verticals
    self
  end

  def horizontals
    self.transpose
  end

  def diagonals

  end

  def check_lines?
    lines = verticals #+ horizontals + diagonals # line is an array upto size 7
    lines.each do |line|
      return true if has_four_in_a_row?(line)
    end
    false
  end

  def has_four_in_a_row?(line)
    return false if line.length < 4
    piece_color = line[0]
    counter = 0
    line.each do |piece|
      piece == piece_color ? counter += 1 : piece_color = piece
      return true if counter == 4
    end
    false
  end

  def render
    p self

  end
end
