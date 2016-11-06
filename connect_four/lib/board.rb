class Board

  # board = [
  #           0  1  2  3  4  5  6
  #          [r, b, r, b, b, b, b], # board[0]
  #          [0, 0, 0, 0, 0, b, 0], # board[1]
  #          [0, 0, 0, 0, 0, b, 0], # board[2]
  #          [0, 0, 0, 0, 0, b, 0], # board[3]
  #          [0, 0, 0, 0, 0, 0, 0], # board[4]
  #          [0, 0, 0, 0, 0, 0, 0]  # board[5]
  #         ]

  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7) { 0 } }
  end

  def update(col_num, piece) 
    col_num -= 1
    @board.length.times do |row_num|
      if @board[row_num][col_num] == 0
        @board[row_num][col_num] = piece 
        break
      end
    end
    self 
  end

  def valid_move?(col_num)
    last_row = 5
    col_num -= 1
    @board[last_row][col_num] == 0
  end

  def win? 
    horizontal_win? || vertical_win? || 
    diagonal_tl_br_win? || diagonal_tr_bl_win?
  end

  def full?
    !@board.flatten.include?(0)
  end

  private

  def horizontal_win?
    @board.each do |row|
      start_point, end_point = 0, 3
      (start_point..end_point).each do |offset|
        four_piece_array = row[start_point+offset..end_point+offset]
        next if four_piece_array.include?(0)
        return true if four_in_a_row?(four_piece_array)
      end
    end
    false
  end

  def vertical_win?
    @board = @board.transpose
    result = horizontal_win?
    @board = @board.transpose
    result
  end

  def diagonal_tl_br_win?
    rows_to_check = @board[0..2]
    rows_to_check.each_with_index do |row, row_num| # row_num = 0, 1, 2
      start_point, end_point = 0, 3
      (start_point..end_point).each do |col_num| # col_num = 0, 1, 2, 3
        offset = 0
        four_piece_array = []
        while offset < 4
          four_piece_array << @board[row_num+offset][col_num+offset]
          offset += 1
        end
        next if four_piece_array.include?(0)    
        return true if four_in_a_row?(four_piece_array) 
      end
    end
    false
  end

  def diagonal_tr_bl_win?
    flip_board
    result = diagonal_tl_br_win?
    flip_board
    result
  end

  def flip_board
    @board.map! { |row| row.reverse }
  end

  def four_in_a_row?(four_piece_array)
    first_piece = four_piece_array[0]
    four_piece_array.all? { |piece| piece == first_piece }
  end

end
