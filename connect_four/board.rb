
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

  def rows
    grid
  end

  def columns
    grid.transpose
  end

  def diagonals

  end

  private
      attr_reader :grid
end

class Board

  def initialize(args = {})
    @board = args[:grid] || Grid.new(rows: 6, columns: 7)
    @view = BoardView
  end

  def add_piece(column, value)
    column = board.columns[column - 1]
    row = top_most_empty_spot(column)
    board.set_cell(row, col, value)
  end

  def topmost_empty_spot(column)
    top_most_spot = column.find_index { |e| !e.nil? }
    if top_most_spot.nil?
      column.length - 1
    else
      top_most_spot - 1
    end
  end

  def column_not_full?(column)
    column.any? { |e| e.nil? }
  end

  def render
    view.render(board)
  end

  def in_range?(column)
    column > 0 &&
    column <= board.column_count
  end

  private
    attr_reader :board, :view
end

