
class Grid
  attr_reader :column_count, :row_count

  def initialize(args = {})
    @row_count     = args[:rows]    
    @column_count  = args[:columns]  
    @grid          = Array.new(row_count) { Array.new(column_count) }
  end

  def set_cell(row, col, value)
    grid[row][col] = value    
  end

   private
      attr_reader :grid
end

class Board

  def initialize(args = {})
    @board = args[:grid] || Grid.new(rows: 6, columns: 7)
  end

  def add_piece(coordinates, value)
    row = coordinates[0] - 1
    col = coordinates[1] - 1
    board.set_cell(row, col, value)
  end

  private
    attr_reader :board
end

