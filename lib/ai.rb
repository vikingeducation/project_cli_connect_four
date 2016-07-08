class AI < Player

  def initialize(color, board)
    super("Compy", color, board)
  end

  def make_move
    # if close wins, try to complete horizontal, vertical or diagonal
  end


  def close?
    close_wins(@board.horizontals) ||
    close_wins(@board.verticals) ||
    close_wins(@board.rising_diagonals) ||
    close_wins(@board.falling_diagonals)
  end


  def close_wins(array)

    arrays.each do |array|
      counter_r = 0
      counter_b = 0
      array.each do |space|
        if space.empty?
          counter = 0
        elsif space.color == "R"
          counter_r += 1
          if counter_r > 2 
            #returns location to input piece
        elsif space.color == "B"
          counter_b += 1
          if counter_b > 2
            # returns location to input piece
        end
      end
      return true if (counter_r > 4 || counter_b == 4)
    end
    return false

  end

# verticals
  def close_verticals(array)

    arrays.each do |array|
      counter_r = 0
      counter_b = 0
      array.each do |space|
        if space.empty?
          counter = 0
        elsif space.color == "R"
          counter_r += 1
          if counter_r > 2 && array[space.index + 1]
            # returns location to input piece
        elsif space.color == "B"
          counter_b += 1
          if counter_b > 2 && array[space.index + 1]
            # returns location to input piece
        end
      end
      return true if (counter_r > 4 || counter_b == 4)
    end
    return false

  end


end