class Board
  def initialize
    @board_width = 7
    @board_height = 6
    @board = Array.new(@board_width){Array.new(@board_height)}
  end

  def drop_token(column_number,game_token)
    board_full
     if column_full(column_number)
       false
     else
      i = 5
      while @board[column_number][i] != nil
        i -= 1
      end
      @board[column_number][i] = game_token
      #animates the dropping of the token4, can be buggy but fun
      #MODULATE!!
      animate = 0
      while animate < i
        @board[column_number][animate] = game_token
        board_render
        sleep 0.1
        puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        @board[column_number][animate] = nil
        animate += 1
      end       
    end
    #MODULATE!!
    if win?
      board_render
      puts " #{game_token} wins! play again? (y/n)"
      print "> "
      another_play = gets.strip.chomp
      if another_play.downcase == "y"
        schwad = Game.new
        schwad.play
      else
        exit
      end
    else
      true
    end
  end

  def column_full(column_no)
    #binding.pry                  #pry stuff
    @board[column_no].all?
  end

  def board_full
    if @board.flatten.all?
      puts "Oh no, the board is full! Let's start again!"
      schwad = Game.new
      schwad.play
    end
  end

  def board_render
        
    # This method will render the pegs top-down
    # The first peg will be printed, followed by a tab, then second and so on
    iterator_row = 0

    puts  "Current Board:"
    while (iterator_row <= 6)
      iterator_column = 0
      7.times do 
        if @board[iterator_column][iterator_row]!=nil
        print @board[iterator_column][iterator_row]
        end
        print "\t"
        iterator_column += 1
      end      
      puts ""
      iterator_row += 1
    end
    puts "0\t1\t2\t3\t4\t5\t6\n"
  end

  def win?
   # Checks vertical, horizontal, and diaogonal victory conditions
    vertical_win? ||
    horizontal_win? ||
    up_diagonal_win? ||
    down_diagonal_win?
  end
  def vertical_win?
    @board.each do |col|
      0.upto(2) do |row|
        test_array = [ col[row],
                       col[row+1],
                       col[row+2],
                       col[row+3] ]
        return true if winning_array?(test_array)
      end
    end
    false
  end

  def horizontal_win?
    row = 0
    while row < 7 do
      0.upto(3) do |col|
        test_array = [ @board[col][row],
                       @board[col+1][row],
                       @board[col+2][row],
                       @board[col+3][row] ]
        return true if winning_array?(test_array)
      end
      row += 1
    end
    false
  end

  def up_diagonal_win?
    col = 0
    while col < 4 do
      0.upto(2) do |row|
        test_array = [ @board[col][row],
                       @board[col+1][row+1],
                       @board[col+2][row+2],
                       @board[col+3][row+3] ]
        return true if winning_array?(test_array)
      end
      col += 1
    end
    false
  end

  def down_diagonal_win?
    col = 0
    while col < 4 do
      5.downto(3) do |row|
        test_array = [ @board[col][row],
                       @board[col+1][row-1],
                       @board[col+2][row-2],
                       @board[col+3][row-3] ]
        return true if winning_array?(test_array)
      end
      col += 1
    end
    false
  end

  def winning_array?(array)
    !array.include?(nil) && array.uniq.length == 1
  end

end
