
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(7){[]}
  end


  def vertical_win?(grid)
    grid.chunk { |piece| piece }.map{|a,b| b}.any? { |arr| arr.count >= 4 }
  end

  def horizontal_win?(grid)
    vertical_win?(grid.transpose)
  end

  def diagonal_win?(grid)
    vertical_win?(diagonalize(grid))
  end

  def diagonalize(grid)
    copy = fill_copy(grid)
    arr = []



  end

  def fill_copy(grid)
    copy = grid
    copy.length.times do |x|
      until copy[x].length == 7
        x << "x"
      end
    end
    copy
  end


end
