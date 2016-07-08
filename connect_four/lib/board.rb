=begin
Public-facing interface
initialize
  Board should have a grid
  that grid should be an array of 7 arrays

grid
  return the grid
move
  after move is called one of the arrays in grid should have a piece in it
game_over?
  returns a boolean depending on victory conditions
victory?
  returns a boolean depending on state of the grid


Private Methods
vertical_win?
horizontal_win?
diagonal_win?
diagonalize
victory?
draw?
game_over?
column_full?




=end

class Board
  attr_accessor :grid

  def initialize(grid = nil)
    @grid = grid || Array.new(7){[]}
  end

  def move(column, piece)
    grid[column-1].push(piece)
  end

  def victory?
    horizontal_win?(grid) || vertical_win?(grid) || diagonal_win?(grid)
  end

  def game_over?
    victory? || draw?
  end

  private

  def vertical_win?(grid)
    status = false
    grid.each do |column|
      if column.chunk { |piece| piece }.map{|a,b| b}.any? { |arr| arr.count >= 4 }
        status = true
        break
      end
    end
    status
  end

  def horizontal_win?(grid)
    vertical_win?(fill_copy(grid).transpose)
  end

  def diagonal_win?(grid)
    vertical_win?(diagonalize(grid))
  end

  def diagonalize(grid)
    copy = fill_copy(grid)
    diagonals = half_diags(copy) + half_diags(copy.reverse)
    diagonals
  end

  def draw?
    full = true
    @grid.length.times do |col|
       if !column_full?(col)
         full = false
       end
    end
    full
  end

  def column_full?(column)
    @grid[column].length == 6
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
    copy = grid.dup.map! {|x| x.dup}
    copy.length.times do |x|
      until copy[x].length == 6
        copy[x] << x.to_s
      end
    end
    copy
  end

end
