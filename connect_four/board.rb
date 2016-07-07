
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(7){[]}
  end


  def vertical_win?(grid)
    grid.chunk { |piece| piece }.map{|a,b| b}.any? { |arr| arr.count >= 4 }
  end

  def horizontal_win?(grid)   
    vertical_win?(grid.transpose)
  end




end
