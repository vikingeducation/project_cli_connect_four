class Board
  def initialize
    @board = Array.new(7, [])
  end

  def add_to_col?(move)
    unless col_full? 
      @board[move[:col]] << @player.move[:color]
    else
      false
    end
  end

  def win?
    check_verticals? || check_horizontals? || check_diagonals?
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
    lines = verticals + horizontals + diagonals
    lines.each do |line|
      return true if line.has_four_in_a_row?
    end
    false
  end

  def check
    
  end

  def display_board
    
  end
end