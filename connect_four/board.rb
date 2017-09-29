require 'pry'
class Board < Array
  attr_accessor :board, :red_piece, :black_piece

  def initialize
    @board = [['1', '2', '3', '4', '5', '6', '7'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', 'R', '-', '-', '-', '-'],
              ['-', '-', '-', 'R', '-', '-', '-'],
              ['-', '-', '-', '-', 'R', '-', '-'],
              ['-', '-', '-', '-', '-', 'R', '-'],
              ['-', '-', '-', '-', '-', '-', '-']]
    @diagonals = [[board[3][0], board[4][1], board[5][2], board[6][3]],
                  [board[2][0], board[3][1], board[4][2], board[5][3], board[6][4]],
                  [board[1][0], board[2][1], board[3][2], board[4][3], board[5][4], board[6][5]],
                  [board[1][1], board[2][2], board[3][3], board[4][4], board[5][5], board[6][6]],
                  [board[1][2], board[2][3], board[3][4], board[4][5], board[5][6]],
                  [board[1][3], board[2][4], board[3][5], board[4][6]],
                  [board[3][6], board[4][5], board[5][4], board[6][3]],
                  [board[2][6], board[3][5], board[4][4], board[5][3], board[6][2]],
                  [board[1][6], board[2][5], board[3][4], board[4][3], board[5][2], board[6][1]],
                  [board[1][5], board[2][4], board[3][3], board[4][2], board[5][1], board[6][0]],
                  [board[1][4], board[3][3], board[4][2], board[5][1], board[6][0]],
                  [board[1][3], board[2][2], board[3][1], board[4][0]]]                      
  end

  def each(&block)
    @board.each(&block)
  end

  def transpose
    @board.transpose
  end

  def display_board
    board.each do |row|
      row.each { |space| print space}
      print "\n"
    end
  end

  def update_board(column, current_player_piece)
    row = 0
    1.upto(6) do |num|
      row = num if self.board[num][column - 1] == '-'
    end
    if !row.zero?
      self.board[row][column - 1] = current_player_piece
    else
      row
    end
  end

  def win_horizontal?(current_player_piece)
    board.each do |row|
      count = 0
      row.each do |position|
        if position == current_player_piece
          count += 1
          return true if count == 4
        else
          count = 0
        end
      end
    end
    false
  end

  def win_vertical?(current_player_piece)
    board.transpose.each do |row|
      count = 0
      row.each do |position|
        if position == current_player_piece
          count += 1
          return true if count == 4
        else
          count = 0
        end
      end
    end
    false
  end

  def win_diagonal?(current_player_piece)
    count = 0
    @diagonals.each do |diagonal|
      diagonal.each do |position|
        if position == current_player_piece
          count += 1
          return true if count == 4
        else
         count = 0
        end
      end
      false
    end
  end
end