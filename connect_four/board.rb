class Board
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def render

    @board.each do |row|
      row.each do |square|
        if square.nil?
          print "o "
        else
          #print square.color
        end
      end
      puts
    end
    puts
  end
end
