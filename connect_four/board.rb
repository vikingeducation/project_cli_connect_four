# board.rb

class Board
  attr_reader :board

  def initialize
    @board = Array.new(7) { Array.new(6, "_") }
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
    # check_columns?(piece) || 
    # check_rows?(piece) ||
    check_lr_diagonals?(piece)
    # check_rl_diagonals?
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
          return true
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
        if row_array.all? { |element| element == piece }
          return true
        end
      end
    end
    false
  end

 def check_lr_diagonals?(piece)
    3.times do |row|
      4.times do |column|
        diagonal_array = []
        4.times do |index|
          diagonal_array << board[column + index][row + index]
        end
        if diagonal_array.all? { |element| element == piece}
          return true
        end
      end
    end
    false
  end


end

