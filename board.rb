class Board

  attr_reader :columns

  def initialize
    @columns = Array.new(7) { Array.new(6, '-') }
    @searchable_board = @columns.transpose.flatten
  end

  def rows(index)
    rows = @columns.transpose
    rows[index]
  end

  def render
    puts
    puts "  1  2  3  4  5  6  7"
    5.downto(0) do |row_index|
      print "|"
      rows(row_index).each do |item|
          print " #{item} "
      end
      print "|"
      puts
    end
  end

  def process_choice(choice, piece)
    column_index = choice - 1
    row_index = @columns[choice-1].index('-')
    @columns[column_index][row_index] = piece
    [column_index, row_index, piece]
  end

  def draw?
    return false if @searchable_board.include?('-')
  end

  def win?(column_index, row_index)
    if vertical_win?(column_index, piece)
      return true
    else
      false
    end
  end

  def test_object(relevant_array, piece)
    test_object = relevant_array.join
    return true if test_object.include?(piece*4)
    false
  end

  def vertical_win?(column_index, piece)
    test_object(@columns[column_index], piece)
  end

  def horizontal_win?(row_index, piece)
    test_object(rows[row_index], piece)
  end

  def diagonal_win?(column_index, row_index, piece)
    test_object(upward_diagonal(column_index, row_index), piece)
    test_object(downward_diagonal(column_index, row_index), piece)
  end

  def upward_diagonal(column_index, row_index)
    generate_diagonal(column_index, row_index, 8)
  end

  def downward_diagonal(column_index, row_index)
    generate_diagonal(column_index, row_index, 6)
  end

  def generate_diagonal(column_index, row_index, diff)
    diagonal_array = []
    position_on_searchable = column_index + (row_index*7)
    search_start_point = position_on_searchable % 7
    diagonal_indexes = (0..41).to_a.select { |i| i % diff == search_start_point }
    diagonal_indexes.each { |i| diagonal_array << @searchable_board }
    diagonal_array
  end

end

#bb = Board.new
#bb.render