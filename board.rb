class Board

  attr_reader :board

  def initialize
    @board = Array.new(7){Array.new(7)}
  end

  def render
    puts
    puts "0   1   2   3   4   5   6"
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        col.nil? ? print("-".center(4)) : print(col.to_s.center(4))
      end
      puts
    end
  end

  def add_piece(column, piece)
    if legal_move?(column)
      counter = 0
      while @board[6 - counter][column] != nil
        counter += 1
      end
      if counter == 7
        puts "That column is full."
        false
      end
      @board[6 - counter][column] = piece
      true
    else
      false
    end
  end

  def winning_move?(piece)
    diagonal_win?(piece)   ||
    horizontal_win?(piece) ||
    vertical_win?(piece)
  end

  def full_board?
    @board.each do |column|
      if column.any? {|piece| piece == nil}
        return false
      else
        true
      end
    end
  end

  def legal_move?(column)
    if within_valid?(column)
      true
    else
      false
    end
  end

  def within_valid?(column)
    if (0..6).include?(column)
      true
    else
      puts "# That space doesn't exist."
      false
    end
  end

  def diagonal_win?(piece)
    if up_diagonals?(piece) || down_diagonals?(piece)
      true
    end
  end

  def vertical_win?(piece)
    @board.each do |column|
      3.times do |index|
        if column[index..(index + 3)].all? {|element| element == piece}
          return true
        end
      end
    end
    false
  end

  def horizontal_win?(piece)
    6.times do |row|
      4.times do |column|
        result = []
        4.times do |index|
          result << @board[column + index][row]
        end
        if result.all? {|element| element == piece}
          return true
        end
      end
    end
    false
  end

  def up_diagonals?(piece)
    3.times do |row|
      4.times do |column|
        result = []
        4.times do |index|
          result << @board[column + index][row + index]
        end
        if result.all? {|element| element == piece}
          return true
        end
      end
    end
    false
  end

  def down_diagonals?(piece)
    row_index = 3
    while row_index <= 5
      4.times do |column|
        result = []
        4.times do |index|
          result << @board[column + index][row_index - index]
        end
        if result.all? {|element| element == piece}
          return true
        end
      end
      row_index += 1
    end
    false
  end

end