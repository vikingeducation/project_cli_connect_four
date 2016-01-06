class Logic

  def initialize
  end


  def horizontal_win?(array, color)
    # [0 1 2 3 4 5 6]
    # [r r g g r r r ]
    consecutive = 0
    array.each_with_index do |column, index|
      if array[index] == color
        consecutive += 1
        puts "consecutive: #{consecutive}"
        return true if consecutive == 4
      else
        consecutive = 0
      end
    end
    false
  end


  def vertical
  end


  def diagonal
  end





end