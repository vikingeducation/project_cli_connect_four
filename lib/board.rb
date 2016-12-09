require 'pry'
class Board

  attr_reader :columns

  def initialize(board_input=false)
    @columns = ( board_input || Array.new(7) { Array.new(6, '-') })
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
    column_index = choice
    row_index = @columns[column_index].index('-')
    @columns[column_index][row_index] = piece
    [column_index, row_index, piece]
  end

  def draw?
    return false if @columns.flatten.include?("-")
    true
  end

  def win?(move)
    column_index = move[0]
    row_index = move[1]
    piece = move[2]
    return true if horizontal_win?(row_index, piece) || 
      vertical_win?(column_index, piece) || 
      upper_diagonal_win?(column_index, row_index, piece)|| 
      downward_diagonal_win?(column_index, row_index, piece)
    false
  end

  protected

  def test_object(relevant_array, piece)
    test_object = relevant_array.join
    return true if test_object.include?(piece*4)
    false
  end

  def vertical_win?(column_index, piece)
    test_object(@columns[column_index], piece)
  end

  def horizontal_win?(row_index, piece)
    test_object(rows(row_index), piece)
  end

  def upper_diagonal_win?(column_index, row_index, piece)
    test_object(upward_diagonal(column_index, row_index), piece)
  end

  def downward_diagonal_win?(column_index, row_index, piece)
    test_object(downward_diagonal(column_index, row_index), piece)
  end

  def upward_diagonal(column_index, row_index)
    a = upward_diagonal_lower_left(column_index, row_index) 
    b = upward_diagonal_upper_right(column_index, row_index)
    a + b
  end

  def upward_diagonal_upper_right(column_index, row_index)
    upper_right = [@columns[column_index][row_index]]
    loop do
      column_index += 1
      row_index += 1
      if (0..6).include?(column_index) && (0..5).include?(row_index)
        upper_right << @columns[column_index][row_index]
      else
        break
      end
    end
    upper_right
  end

  def upward_diagonal_lower_left(column_index, row_index)
    lower_left = []
    loop do
      column_index -= 1
      row_index -= 1
      if (0..6).include?(column_index) && (0..5).include?(row_index)
        lower_left << @columns[column_index][row_index]
      else
        break
      end
    end
    lower_left.reverse
  end

  def downward_diagonal(column_index, row_index)
    a = downward_diagonal_upper_left(column_index, row_index)
    b = downward_diagonal_lower_right(column_index, row_index)
    a + b
  end

  def downward_diagonal_upper_left(column_index, row_index)
    upper_left = []
    loop do
      column_index -= 1
      row_index += 1
      if (0..6).include?(column_index) && (0..5).include?(row_index)
        upper_left << @columns[column_index][row_index]
      else
        break
      end
    end
    upper_left.reverse
  end

  def downward_diagonal_lower_right(column_index, row_index)
    lower_right = [@columns[column_index][row_index]]
    loop do
      column_index += 1
      row_index -= 1
      if (0..6).include?(column_index) && (0..5).include?(row_index)
        lower_right << @columns[column_index][row_index]
      else
        break
      end
    end
    lower_right
  end
end





