class Board
  attr_reader :board
  def initialize
    @board = Array.new(6){ [] }
  end

  def render
    (1..6).each_with_index do |label, i|
      s = i == 0? 4 : 4
      print " #{label} ".rjust(s)
    end

    puts

    (0...@board.size).reverse_each do |i|
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
    return true if four_across?
    return true if four_diagonal?
    false
  end

  def valid_move?(col)
    # make sure slot exists
    unless col.between?(0,5)
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

  def four_diagonal?
    #left_diagonal
    @board.each_with_index do |row, r|
      row.each_with_index do |item, c|
        return true if diagonal(c, r, 1, 1) || diagonal(c, r, -1, 1)
      end
    end
    false
  end

  def diagonal(column, row, increment, counter)
    return false if column + increment > 5 || row + increment > 5
    return false if column + increment < 0 || row + increment < 0
    # column and row == coordinates
    # increment = increment, which determines direction of diagonal line
    if @board[column][row] == @board[column + increment][row - 1] && !@board[column][row].nil?
      counter += 1
      return true if counter == 4
      diagonal(column + increment, row - 1, increment, counter)
    end
  end

  def four_across?
    down = 1
    across = 1
    (0..5).each do |i|
      (0..5).each do |j|
        # same "row" x[0][1], x[0][2]
        if @board[i][j] == @board[i][j-1] && !@board[i][j-1].nil? && j - 1 > -1
          down += 1
        else
          down = 1
        end
        # same col x[1][0], x[2][0], x[3][0]
        if @board[j][i] == @board[j-1][i] && !@board[j-1][i].nil?
          across += 1
        else
          across = 1
        end
        return true if down == 4 || across == 4
      end
    end
    false
  end

end
