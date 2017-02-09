class Board
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def render
    puts

    5.downto(0) do |row|
      @board[row].each do |column|
        print "| "
        column.nil? ? print("-") : print(column)
        print " |"
      end
      puts
    end

    7.times { print "|---|" }
    puts
    1.upto(7) { |i| print "| #{i} |" }
    puts
    puts
  end

  def add_piece(column_label, piece)
    column_index = column_label - 1

    if move_valid?(column_label)
      @board.each_with_index do |row, i|
        if row[column_index].nil?
          @board[i][column_index] = piece
          return true
        end
      end
    else
      false
    end
  end

  def move_valid?(column_label)
    if column_valid?(column_label) && column_available?(column_label)
      true
    else
      puts "Invalid move."
      false
    end
  end

  def column_valid?(column_label)
    if column_label >= 1 && column_label <= 7
      true
    else
      puts "Invalid move."
    end
  end

  def column_available?(column_label)
    column(column_label).include?(nil) ? true : false
  end

  def column(column_label)
    column_arr = []

    @board.each do |row|
      column_arr.push(row[column_label - 1])
    end

    column_arr
  end

  def winning_combination?(piece)
    winning_diagonal?(piece) || winning_vertical?(piece) || winning_horizontal?(piece)
  end

  def winning_diagonal?(piece)
    diagonals.each do |diagonal|
      consecutive_pieces = 0
      diagonal.each do |slot|
        if slot == piece
          consecutive_pieces += 1
          return true if consecutive_pieces == 4
        else
          consecutive_pieces = 0
        end
      end
    end

    false
  end

  def winning_vertical?(piece)
    verticals.each do |column|
      consecutive_pieces = 0
      column.each do |slot|
        if slot == piece
          consecutive_pieces += 1
          return true if consecutive_pieces == 4
        else
          consecutive_pieces = 0
        end
      end
    end

    false
  end

  def winning_vertical_available?(piece)
    verticals.each do |column|
      consecutive_pieces = 0
      column.each do |slot|
        if slot == piece
          consecutive_pieces += 1
        elsif slot.nil? && consecutive_pieces == 3
          return true
        else
          consecutive_pieces = 0
        end
      end
    end
    false
  end

  def winning_vertical_move(piece)
    verticals.each_with_index do |column, column_index|
      consecutive_pieces = 0
      column.each do |slot|
        if slot == piece
          consecutive_pieces += 1
        elsif slot == nil && consecutive_pieces == 3
          return column_index
        else
          consecutive_pieces = 0
        end
      end
    end

    false
  end

  def winning_horizontal?(piece)
    horizontals.each do |row|
      consecutive_pieces = 0
      row.each do |slot|
        if slot == piece
          consecutive_pieces += 1
          return true if consecutive_pieces == 4
        else
          consecutive_pieces = 0
        end
      end
    end

    false
  end

  def winning_horizontal_available?(piece)
    horizontals.each_with_index do |row, row_index|
      consecutive_pieces = 0

      row.each_with_index do |slot, column_index|
        if slot == piece
          consecutive_pieces += 1
        elsif consecutive_pieces == 3
          if column_index >= 4
            column_before_sequence = column_index - 4
            slot_before_sequence = @board[row_index][column_before_sequence]
            return true if slot_before_sequence.nil?
          end

          return true if slot.nil?
        end
      end
    end

    false
  end

  def winning_horizontal_move(piece)
    horizontals.each_with_index do |row, row_index|
      consecutive_pieces = 0

      row.each_with_index do |slot, column_index|
        if slot == piece
          consecutive_pieces += 1
        elsif consecutive_pieces == 3
          if column_index >= 4
            column_before_sequence = column_index - 4
            slot_before_sequence = @board[row_index][column_before_sequence]
            return column_before_sequence if slot_before_sequence.nil?
          end

          return column_index if slot.nil?
        end
      end
    end

    false
  end

  def diagonals
    diagonals_arr = []

    3.times do |i|
      column_start = 0
      row_start = 0
      row_start += i
      column = column_start
      row = row_start
      diagonal = []

      while column <= 6 && row <= 5
        diagonal.push(@board[row][column])
        column += 1
        row += 1
      end

      diagonals_arr.push(diagonal)
    end

    3.times do |i|
      column_start = 1
      row_start = 0
      column_start += i
      column = column_start
      row = row_start
      diagonal = []

      while column <= 6 && row <= 5
        diagonal.push(@board[row][column])
        column += 1
        row += 1
      end

      diagonals_arr.push(diagonal)
    end

    3.times do |i|
      column_start = 6
      row_start = 0
      row_start += i
      column = column_start
      row = row_start
      diagonal = []

      while column >= 0 && row <= 5
        diagonal.push(@board[row][column])
        column -= 1
        row += 1
      end

      diagonals_arr.push(diagonal)
    end

    3.times do |i|
      column_start = 5
      row_start = 0
      column_start -= i
      column = column_start
      row = row_start
      diagonal = []

      while column >= 0 && row <= 5
        diagonal.push(@board[row][column])
        column -= 1
        row += 1
      end

      diagonals_arr.push(diagonal)
    end

    diagonals_arr
  end

  def verticals
    columns = []

    1.upto(7) do |column_label|
      columns.push(column(column_label))
    end

    columns
  end

  def horizontals
    @board
  end

  def slot_available?
    if @board[row_index][column_index].nil?
      true
    else
      false
    end
  end

  def possible_move?(column_index, row_index)
    if slot_available?
      if row_index == 0
        true
      elsif @board[row_index - 1][column_index].nil?
        false
      else
        true
      end
    end
  end

  def full?
    @board.each do |row|
      row.each do |slot|
        return false if slot.nil?
      end
    end

    true
  end
end