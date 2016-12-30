class Player
  attr_reader :piece, :name

  def initialize(name='Player 2', piece='o')
    @name = name
    @piece = piece
    @move = ''
  end

  def reset_moves
    @move = ''
  end

  def get_move(board)
    # accept board so that we can verify the validity of the
    until valid_format? && board.valid_move?(move)
      prompt_move(board)
    end
  end

  def move
    # make sure we pass it in a format that 'board' understands
    @move - 1
  end

  private


  def valid_format?
    !@move.nil? && @move.to_s.length == 1
  end

end

class AI < Player

  def move
    @move
  end

  private

  def prompt_move(board=nil)
    @move = rand(0..5)
  end


  def diagonal?(x, y, increment, counter)
    return false if x + increment > 5 || y + 1 > 5
    return false if x + increment < 0 || y + 1 < 0
    # x and y == coordinates
    # increment = increment, which determines direction of diagonal line
    if @board[y][x] == @board[y + 1][x + increment] && !@board[y][x].nil?
      counter += 1
      return true if counter == 3
      diagonal(x + increment, y + 1, increment, counter)
    end
  end

  def down?(x, y, increment, counter)
    return false if y + increment > 5
    if @board[y][x] == @board[y + increment][x]
      counter += 1
      return true if counter == 3
      down?(x, y + increment, increment, counter)
    end
  end

  def across?(x, y, increment, counter )
    return false if x + increment > 5
    if @board[y][x] == @board[y][x + increment]
      counter += 1
      return true if counter == 3
      across?(x + increment, y, increment, counter)
    end
  end
end

class Human < Player

  private

  def prompt_move(board=nil_)
    puts "Enter column (1-6) in which you'd like to place your piece. Enter '1' for column 1, '2' for column 2 and so on."
    print "#{@name}: "
    @move = gets.strip
    exit if @move == 'q'
    @move = @move.to_i
    puts
    puts "Please check the format of your move."  unless valid_format?
  end

end
