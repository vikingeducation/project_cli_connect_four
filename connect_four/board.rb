class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new }
  end

  def check_victory
    vertical_check || horizontal_check || diagonal_up_check || diagonal_down_check
  end

  def vertical_check
    result=true
    0.upto(3) do |i|
     result = false unless (@board[@last_move][-1-i]  == @board[@last_move][-1])
    end
    result
  end

  def horizontal_check
    result = true
    color = @board[@last_move][-1]
    row = @board[@last_move].length-1
    same_count = 0
    (0..6).each do |i|
      if @board[i][row] == color
        same_count += 1
        return true if same_count == 4
      else
        same_count=0
      end
    end
    false
  end


  def diagonal_up_check
    (0..6).each do |column|
      (0..5).each do |row|
        color = @board[column][row]
        break unless @board[column+3] && @board[column+3][row+3]
        return true if @board[column+1][row+1] == color && @board[column+2][row+2] == color && @board[column+3][row+3] == color
      end
    end
    false
  end

  def diagonal_down_check
    (0..6).each do |column|
      (0..5).each do |row|
        color = @board[column][row]
        break unless @board[column-3] && @board[column-3][row+3]
        return true if @board[column-1][row+1] == color && @board[column-2][row+2] == color && @board[column-3][row+3] == color
      end
    end
    false
  end

  def check_draw?
    @board.all? {|i| i.length == 6}
  end

  def valid_move?(column, color)
    (0..6).include?(column) && @board[column].length < 6
  end

  def add_piece(column, color)
    @last_move = column
    @board[column] << color
  end

  def render
    5.downto(0) do |row|
      0.upto(6) do |column|
        if @board[column][row]
          print "| #{@board[column][row]} "
        else
          print "|   "
        end
      end
      puts "|\n"
      puts "-" * 29
    end
    print "  "
    0.upto(6) {|i| print i.to_s.ljust(4)}

    puts "\n\n"
  end

end