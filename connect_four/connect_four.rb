# connect4 heightxwidth = 6x7
# player
# human
# board
# game
# pieces
# later: computer

def Connect_four

  def initialize
  end

  def play
  end

  def win?
    check_win(@board.horizontals)
    check_win(@board.verticals)
    check_win(@board.rising_diagonals)
    check_win(@board.falling_diagonals)
  end

  def full_board?
    @boards.horizontals.each do |row|
      if row.any? {|row| row == []}
        return false
      end
    end
    return true
  end


  def switch_players
  end

  def turn_over
  end

  def check_win(arrays)
    counter = 0
    arrays.each do |array|
      i = 0
      if array[i].color == array[i + 1].color
        i += 1
        counter += 1
      else
        counter = 0
      end
      counter == 3 ? true : false
    end
  end

end




# Your code here!