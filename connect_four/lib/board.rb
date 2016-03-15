=begin
  public : create_board, render, move, full?, victory?
  private : make_move, move_possible?, find_row, horizontal?, vertical?, diagonal_left?, diagonal_right?
            @board_game
=end


class Board
  def initialize (board = nil)
    if board == nil
      @board_game = {}
      create_board
    else
      @board_game = board
    end
  end

  def create_board
    (1..6).each do |row|
      @board_game[row] = Array.new(7, " ")
    end
  end


  def render
    @board_game.values.each do |row|
      row.each do |cell|
        print "|#{cell}|"
      end
      print "\n"
    end
    print "|1||2||3||4||5||6||7|\n"
  end

  def move( move, symbol )
    if move_possible? move
      make_move( move, symbol )
      return true
    end
    false
  end


  def full?
    @board_game.values.each do |row|
      if row.include?(" ")
        return false
      end
    end
    puts "\nThe Board is Full ! It's a Tie !"
    true
  end

  def victory?( col, symbol )
    sym = symbol.to_s
    row_number = find_row col
    exit if full?
    return true if horizontal?(col, row_number, sym)
    return true if vertical?(col, row_number, sym)
    return true if diagonal_right?(col, row_number, sym)
    return true if diagonal_left?(col, row_number, sym)
  end

private
  def make_move( move, symbol )
    6.downto(1).each do |row|
      if @board_game[row][move-1] == " "
        @board_game[row][move-1] = symbol.to_s
        break
      end
    end
  end

  def move_possible? move
    @board_game.values.each do |row|
      if row[move-1] == " "
        return true
      end
    end
    puts "The column is already full !\n\n"
    false
  end


  def find_row move
    row_number  = 0
    (1..6).each do |row|
      if @board_game[row][move-1] != " "
        row_number = row
        break
      end
    end
    row_number
  end


  def horizontal? (col, row, sym)
    @board_game[row].join("").include?(sym*4)
  end


  def vertical? (col, row, sym)
    column = ""
    if row <= 3
      (row...row+4).each do |row|
        column << @board_game[row][col-1]
      end
    end
    column.include?(sym*4)
  end


  def diagonal_right?(col, row, sym)
    col -= 1
    temp_col, temp_row = col, row
    until temp_row >= 6 || temp_col <= 0
      temp_col -= 1
      temp_row += 1
    end
    str = ""
    until temp_row < 1 || temp_col > 6
      str << @board_game[temp_row][temp_col].to_s
      temp_col += 1
      temp_row -= 1
    end
    str.include?(sym*4)
  end


  def diagonal_left?(col, row, sym)
    col -= 1
    temp_col, temp_row = col, row
    until temp_row >= 6 || temp_col >= 6
      temp_col += 1
      temp_row += 1
    end
    str = ""
    until temp_row < 1 || temp_col < 0
      str << @board_game[temp_row][temp_col].to_s
      temp_col -= 1
      temp_row -= 1
    end
    str.include?(sym*4)
  end

end