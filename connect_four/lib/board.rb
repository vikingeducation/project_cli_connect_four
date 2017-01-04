class Board
  attr_accessor :board
  def initialize(board=nil)
    @board = board || Array.new(7){ [] }
  end

  def render
    (1..7).each_with_index do |label, i|
      s = i == 0? 4 : 4
      print " #{label} ".rjust(s)
    end

    puts

    (0...6).reverse_each do |i|
      (0...@board.size).each do |j|
        print '| ' if j == 0
        print @board[j][i].nil? ? ' ' : @board[j][i]
        print ' | '
      end
      puts
    end

    puts

  end

  def full?
    @board.each do |row|
      return false if row.size < 6
    end
    true
  end

  def update(player)
    @board[player.move] << player.piece
  end

  def game_won?
    return true if connect_four?
    false
  end

  def valid_move?(col)
    # make sure slot exists
    unless col.between?(0,6)
      puts "I'm afraid that column doesn't exist!"
      return false
    end

    # make sure column is not full
    unless @board[col].size < 6
      puts "That column's full. Choose one with space in it."
      return false
    end
    true
  end

  private

  def connect_four?
    @board.each_with_index do |row, y|
      row.each_with_index do |item, x|
        return true if diagonal(x, y, 1, 1) || diagonal(x, y, -1, 1) || down?(x, y, 1, 1) || across?(x, y, 1, 1, )
      end
    end
    false
  end

  def diagonal(x, y, increment, counter)
    return false if x + increment > 5 || y + 1 > 6
    return false if x + increment < 0 || y + 1 < 0
    # x and y == coordinates
    # increment = increment, which determines direction of diagonal line
    if @board[y][x] == @board[y + 1][x + increment] && @board[y][x]
      counter += 1
      return true if counter == 4
      diagonal(x + increment, y + 1, increment, counter)
    end
  end

  def down?(x, y, increment, counter)
    return false if y + increment > 6
    if @board[y][x] == @board[y + increment][x]
      counter += 1
      return true if counter == 4
      down?(x, y + increment, increment, counter)
    end
  end

  def across?(x, y, increment, counter )
    return false if x + increment > 5
    if @board[y][x] == @board[y][x + increment]
      counter += 1
      return true if counter == 4
      across?(x + increment, y, increment, counter)
    end
  end

end
