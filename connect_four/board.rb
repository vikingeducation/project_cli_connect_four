
class Grid

  def initialize(args = {})
    @row_count     = args[:rows]     || 6
    @column_count  = args[:columns]  || 7
    @grid          = Array.new(column_count) { Array.new(row_count) }
  end

end

class Board

  def initialize(args = {})
    @grid = args[:grid] || Grid.new
  end

  def add_piece(x_coordinate, y_coordinate)
  end

end

