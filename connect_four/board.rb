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

  def get_value(coords)
    return nil unless (0..(row_count-1)).include? coords[0]
    grid[ coords[0] ][ coords[1] ]
  end

  def full?
    # true if none of the cells in a column are nil,
    # for all columns
    columns.all? do |column|
      column.none? do |cell|
        cell.nil?
      end
    end
  end

  def empty?
    columns.all? do |column|
      column.all? do |cell|
        cell.nil?
      end
    end
  end

  def rows
    grid
  end

  def columns
    grid.transpose
  end

  private
  attr_reader :grid
end

class Board
  def initialize(args = {})
    @board = args[:grid] || Grid.new(rows: 6, columns: 7)
    @view = BoardView
    @last_piece = nil
  end

  def add_piece(column, value)
    column_vals = board.columns[column - 1]
    row = top_most_empty_spot(column_vals)

    self.last_piece = { cell: [row, column - 1], value: value }

    board.set_cell(row, column - 1, value)
  end

  def top_most_empty_spot(column)
    top_most_spot = column.find_index { |e| !e.nil? }
    if top_most_spot.nil?
      column.length - 1
    else
      top_most_spot - 1
    end
  end

  def four_in_a_row?
    consecutive = 1

    # Check straight down
    return true if get_consecutive(last_piece[:cell], last_piece[:value], [1,0], consecutive) == 4

    # Check side to side (>= 5 since origin piece will be counted twice)
    if (get_consecutive(last_piece[:cell], last_piece[:value], [0,1], consecutive) +
      get_consecutive(last_piece[:cell], last_piece[:value], [0,-1], consecutive)) >= 5
      return true

    # Check down slope diagonal
    elsif (get_consecutive(last_piece[:cell], last_piece[:value], [-1,1], consecutive) +
      get_consecutive(last_piece[:cell], last_piece[:value], [1,-1], consecutive)) >= 5
      return true

    # Check up slope diagonal
    elsif (get_consecutive(last_piece[:cell], last_piece[:value], [1,1], consecutive) +
      get_consecutive(last_piece[:cell], last_piece[:value], [-1,-1], consecutive)) >= 5
      return true
    end

    return false
  end

  def get_consecutive(cell, value, direction, consecutive)
    return consecutive if consecutive == 4
    return consecutive if board.get_value(cell) == nil
    return consecutive if board.get_value(cell) != value

    next_cell = [ cell[0] + direction[0], cell[1] + direction[1] ]
    consecutive += 1 if board.get_value(next_cell) == value

    get_consecutive(next_cell, value, direction, consecutive)
  end

  def column_not_full?(column)
    board.columns[column - 1].any? { |e| e.nil? }
  end

  def render
    view.render(board) unless board.empty?
  end

  def full?
    board.full?
  end

  def in_range?(column)
    (1..board.column_count).include? column
  end

  protected
  attr_writer :last_piece
  private
  attr_reader :board, :view, :last_piece
end
