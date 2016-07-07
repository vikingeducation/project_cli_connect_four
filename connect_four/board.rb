
class Board
  attr_accessor :grid

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
    diagonals = half_diags(copy) + half_diags(copy.reverse)
    diagonals
  end

  def half_diags(copy)
    arr = []
    (1..2).each do |y|
      arr.push([])
      x = 0
      until x == 7 || y ==6
        arr[-1] << copy[x][y]
        x+=1
        y+=1
      end
    end
    (0..3).each do |x|
      arr.push([])
      y = 0
      until x==7 || y==6
        arr[-1] << copy[x][y]
        x+=1
        y+=1
      end
    end
    arr
  end

  def fill_copy(grid)
    copy = grid
    copy.length.times do |x|
      end
    end
    copy
  end

end

board = Board.new
p board
board.grid=Array.new(7){["a"]}
p board
p board.vertical_win?(board.grid)
