# board.rb
class Board
  attr_accessor :board_arr
  def initialize
    @board_arr = Array.new(7) {Array.new(7, "-")}
  end

  # render
  def render
###################################
    # (0..6).each do |x|
    #    i = 0
    #    (0..6).each do |y|
    #      @board_arr[x][y] = i
    #      i += 1
    #    end
    #  end
 ######################################
  #  puts board_arr.to_s
    (0..6).each do |y|
      output_str = "\n|"
      (0..6).each do |x|
         output_str << "  #{@board_arr[x][y]}  |"
      end
      puts output_str + "\n"
    end
    col_str = "\n|"
    (1..7).each {|n| col_str << "  #{n}  |"}
    puts col_str
  end
end

t = Board.new.board_arr
puts t.to_s
