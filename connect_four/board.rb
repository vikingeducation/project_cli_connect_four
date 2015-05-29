class Board
  attr_reader :last_piece, :winner

  def initialize
    # 7col x 6row array
    @gameboard = Array.new(7) { Array.new(6) { "_" } }
  end


  def render
    print "\n"
    5.downto(0) do |row|
      print " "
      0.upto(6) do |col|
        print "| #{@gameboard[col][row]} "
      end
      print "| \n"
    end
    print " "
    7.times { |index| print "|~#{index + 1}~"}
    print "| \n\n"
  end


  def try_column(column_number, player_piece)

    if @gameboard[column_number][5] == "_"
      place_piece(column_number, player_piece)
    else
      puts "Column is full!  Please try again."
    end

  end


  def place_piece(column, piece)
    #push to lowest index currently open
    0.upto(5) do |row|
      if @gameboard[column][row] == "_"
        @gameboard[column][row] = piece
        break
      end
    end
    @last_piece = piece
  end


  def win_conditions
    win_horizontal
    win_vertical
    win_diagonals
    @winner
  end


  def win_horizontal
    0.upto(5) do |row|
      test_string = String.new

      0.upto(6) do |col|
        test_string << @gameboard[col][row]
      end

      @winner = "Player One" if test_string.include?("XXXX") #why can't I put @player_one.name here???
      @winner = "Player Two" if test_string.include?("OOOO")
    end
  end


  def win_vertical
    @gameboard.each do |column|
      @winner = "Player One" if column.join("").include?("XXXX")
      @winner = "Player Two" if column.join("").include?("OOOO")
    end
  end


  def win_diagonals
    # starting in cols 0 to 3
    0.upto(3) do |col|

      #starting in rows 0 to 2
      0.upto(2) do |row|
        test_string = String.new

        4.times do |index|
          test_string << @gameboard[col + index][row + index]
        end

        @winner = "Player One" if test_string.include?("XXXX")
        @winner = "Player Two" if test_string.include?("OOOO")
      end

      #starting in rows 5 to 3
      5.downto(3) do |row|
        test_string = String.new

        4.times do |index|
          test_string << @gameboard[col + index][row - index]
        end

        @winner = "Player One" if test_string.include?("XXXX")
        @winner = "Player Two" if test_string.include?("OOOO")
      end
    end
  end




# for AI testing
  def find_moves
    possible_moves = []
    @gameboard.each_with_index do |col, col_index|
      move = []
      col.each_with_index do |row, row_index|
        if row == "_"
          move = [row_index, col_index]
          break
        end
      end
      possible_moves << move
    end
    possible_moves
  end


  def find_preferred_move
    preferred_move = nil
    possible_moves = find_moves

    possible_moves.each do |input|
      unless input == []
        if any_possible_win?(input[0], input[1])
          preferred_move = input[1]
          break
        end
      end
    end

    preferred_move
  end


  def possible_horizonatal?(row, col)
    #check horiz
    counter = 1
    1.upto(3) do |index|
      if (col + index).between?(0,6)
        if @gameboard[col + index][row] == "O" # moves right
          counter += 1
        else
          break
        end
      end
    end
    -1.downto(-3) do |index|
      if (col + index).between?(0,6)
        if @gameboard[col + index][row] == "O" # moves left
          counter += 1
        else
          break
        end
      end
    end
    counter >= 4
  end


  def possible_vertical?(row, col)
    #check vertical
    counter = 1
    1.upto(3) do |index|
      if (row + index).between?(0,5)
        if @gameboard[col][row + index] == "O" # moves up
          counter += 1
        else
          break
        end
      end
    end
    -1.downto(-3) do |index|
      if (row + index).between?(0,5)
        if @gameboard[col][row + index] == "O" # moves down
          counter += 1
        else
          break
        end
      end
    end
    counter >= 4
  end


  def possible_diagonal_upright?(row, col)
    #check diagonal
    counter = 1
    1.upto(3) do |index|
      if (col + index).between?(0,6) && (row + index).between?(0,5)
        if @gameboard[col + index][row + index] == "O" # moves right & up
          counter += 1
        else
          break
        end
      end
    end
    -1.downto(-3) do |index|
      if (col + index).between?(0,6) && (row + index).between?(0,5)
        if @gameboard[col + index][row + index] == "O" # moves left & down
          counter += 1
        else
          break
        end
      end
    end
    counter >= 4
  end


  def possible_diagonal_upleft?(row, col)
    #check diagonal
    counter = 1
    1.upto(3) do |index|
      if (col - index).between?(0,6) && (row + index).between?(0,5)
        if @gameboard[col - index][row + index] == "O" # moves left & up
          counter += 1
        else
          break
        end
      end
    end
    -1.downto(-3) do |index|
      if (col - index).between?(0,6) && (row + index).between?(0,5)
        if @gameboard[col - index][row + index] == "O" # moves right & down
          counter += 1
        else
          break
        end
      end
    end
    counter >= 4
  end


  def any_possible_win?(row, col)
    possible_horizonatal?(row, col) || possible_vertical?(row, col) || possible_diagonal_upright?(row, col) || possible_diagonal_upleft?(row, col)
  end

end