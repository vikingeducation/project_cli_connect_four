require_relative "display"
class Board
  attr_accessor :board

  include Display

  def initialize
    @board = build_board
  end

  def build_board
    board_temp = {}
    (1..6).to_a.each do |row|
      (1..7).to_a.each do |column|
        board_temp[[row, column]] = nil
      end
    end
    board_temp
  end

  def show(move, color)
    populate_board(move, color)
    display_board
  end

  def populate_board(column, color)
    row = open_row(column)
    @board[[row, column]] = color
  end

  def open_row(column_num)
    single_column = get_column(column_num).select{ |key, value| value.nil? }
    single_column.keys.empty? ? false : single_column.keys[0][0]
  end

  def legal_move?(column_num)
    open_row(column_num)
  end

  def winning_combo?(current_color)
    four_vertical?(current_color) || four_horizontal?(current_color) || four_diagonal?(current_color)
  end

  def board_full?
    @board.all?{ |key, value| !value.nil? }
  end

  def four_vertical?(color)
    (1..7).to_a.select{ |col| get_column(col).values.each_cons(4).any? { |s,t,r,p| s == t && r == p && t == r && s == color}}.any?
  end

  def four_horizontal?(color)
    (1..6).to_a.select{ |row| get_row(row).values.each_cons(4).any? { |s,t,r,p| s == t && r == p && t == r && s == color}}.any?
  end

  def four_diagonal?(color)
    get_diagonal.any? { |array| array.count(color) == 4}
  end

  def get_column(column_num)
    @board.select { |key, value| key[1] == column_num }
  end

  def get_row(row_letter)
    @board.select { |key, value| key[0] == row_letter }
  end

  def get_diagonal
    front_diag + back_diag
  end

  def front_diag
    diagonal_array = []
    temp_array = []
    (1..3).to_a.each do |row|
      (1..4).to_a.each do |col|
        4.times do |index|
           @board.each{ |key, value| temp_array << value if key == [row + index, col + index] }
        end
        diagonal_array << temp_array
        temp_array = []
      end
    end
    diagonal_array
  end

  def back_diag
    diagonal_array = []
    temp_array = []
    (1..3).to_a.each do |row|
      (4..7).to_a.reverse.each do |col|
        4.times do |index|
           @board.each{ |key, value| temp_array << value if key == [row + index, col - index] }
        end
        diagonal_array << temp_array
        temp_array = []
      end
    end
    diagonal_array
  end



end

("A".."C").to_a.map do |letter|
  ("1".."4").to_a.map do |num|
      board[[letter, num]] = "X"
      board[[letter.next, num.next ]] = "X"
      board[[letter.next.next, num.next.next ]] = "X"
      board[[letter.next.next.next, num.next.next.next ]] = "X"
  end
