# empty board array
# assuming width = 7 && height = 6
  # [
  #  []
  #  []
  #  []
  #  []
  #  []
  #  []
  #  []
  # ]

# semi-filled board array
  # [
  #  ['X','O']
  #  ['X']
  #  []
  #  ['X','O','O']
  #  ['X']
  #  ['O','X','O']
  #  []
  # ]

# full board array 
  # [
  #  ['X','O','X','O','X','O']
  #  ['X','O','X','O','X','O']
  #  ['X','O','X','O','X','O']
  #  ['X','O','X','O','X','O']
  #  ['X','O','X','O','X','O']
  #  ['X','O','X','O','X','O']
  #  ['X','O','X','O','X','O']
  # ]

class Board

  attr_reader :width, :height
  attr_accessor :board

  def initialize(args = {})
    @width = args[:width] || 7
    @height = args[:height] || 6
    raise "Error: board too small" if @height < 4 || @width < 4
    @board = Array.new(@width) { [] }
  end

  def update(column, piece) 
    @board[column-1] << piece
  end

  def valid_move?(column)
    @board[column-1].length < @height
  end

  def win? 
    vertical_win? || horizontal_win? || 
    diagonal_win_neg? || diagonal_win_pos?
  end

  def full?
    @board.all? { |column| column.length == @height }
  end

  private 

  # win conditions

  def vertical_win?
    @board.each do |column|
      next if column.length < 4 
      chunks = column.each_cons(4) 
      return true if has_winning_chunk?(chunks)
    end
    false
  end

  def horizontal_win?
    (0..@height).each do |row_num| 
      row_pieces = []
      @board.each do |column| 
        row_pieces << column[row_num] if column[row_num] # ...exists
      end
      next if row_pieces.length < 4
      chunks = row_pieces.each_cons(4)
      return true if has_winning_chunk?(chunks)
    end
    false
  end

  def diagonal_win_neg? # top left to bottom right diagonal
    return false if not_enough_pieces?
    board_padded = pad_board(nil) # fill all empty spaces in board with nil
    (0..@width-4).each do |col_num| 
      (0..@height-4).each do |row_num| 
        diagonal_pieces = []
        (0..3).each do |offset| 
          diagonal_pieces << board_padded[col_num+offset][row_num+offset] =
        end
        next if diagonal_pieces.include?(nil)
        return true if pieces_identical?(diagonal_pieces)
      end
    end
    false
  end

  def diagonal_win_pos? # top right to bottom left diagonal
    flip_board
    result = diagonal_win_neg?
    flip_board
    result
  end

  # helpers

  def pieces_identical?(piece_array)
    first_piece = piece_array[0]
    piece_array.all? { |piece| piece == first_piece }
  end

  def has_winning_chunk?(chunks) 
    chunks.each do |four_piece_chunk|
      return true if pieces_identical?(four_piece_chunk)
    end
    false
  end

  def not_enough_pieces?
    @board.all? { |column| column.length < 4 }
  end

  def pad_board(pad_val)
    @board.map do |column|
      while column.length < @height
        column << pad_val
      end
      column
    end
  end

  def flip_board 
    @board.map! { |column| column.reverse }
  end

end
