# board.rb

require 'pry'

class Board
  attr_reader :board

  def initialize(board = nil)
    @board = board || Array.new(7) { Array.new(6, "_") }
  end

  def render
    puts
    puts render_board
    puts
  end

  def receive_move?(move)
    if available?(move)
      column, piece = move
      index_of_empty_space = board[column].index("_")
      board[column][index_of_empty_space] = piece
      true
    else
      false
    end
  end

  def check_winner?(piece)
    check_columns?(piece) || 
    check_rows?(piece) ||
    check_up_diagonals?(piece) ||
    check_down_diagonals?(piece)
  end

  def tie?
    board.each do |column|
      if column.any? { |piece| piece == "_" }
        return false
      end
    end
    true
  end

  private

  def render_board
    output = ""
    5.downto(0) do |index|
      board.each { |column| output << " #{column[index]} |" } 
      output << "\n"
    end
    7.times { |column_number| output << " #{column_number + 1}  " }
    output << "\n"
  end

  def available?(move)
    column, _ = move
    board[column].any? { |item| item == "_" }
  end


  def check_columns?(piece)
    board.each do |column|
      3.times do |index|
        if column[index..(index + 3)].all? { |element| element == piece }
          if check_array_for_match(column[index..(index + 3)], piece)
            return true
          end
        end
      end
    end
    false
  end

  def check_rows?(piece)
    6.times do |row|
      4.times do |column|
        row_array = []
        4.times do |index|
          row_array << board[column + index][row]
        end
        if check_array_for_match(row_array, piece)
          return true
        end
      end
    end
    false
  end

 def check_up_diagonals?(piece)
    3.times do |row|
      4.times do |column|
        diagonal_array = []
        4.times do |index|
          diagonal_array << board[column + index][row + index]
        end
        if check_array_for_match(diagonal_array, piece)
          return true
        end
      end
    end
    false
  end

  def check_down_diagonals?(piece)
    row_index = 3
    while row_index <= 5
      4.times do |column|
      diagonal_array = []
        4.times do |index|
          diagonal_array << board[column + index][row_index - index]
        end
        if check_array_for_match(diagonal_array, piece)
          return true
        end
      end
      row_index += 1
    end
    false
  end

  def check_array_for_match(array, piece)
    array.all? { |element| element == piece}
  end

end

