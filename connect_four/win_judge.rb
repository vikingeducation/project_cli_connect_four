class WinJudge
  DIRECTIONS = {
    right: [1, 0],
    left: [-1, 0],
    up: [0,1],
    down: [0,-1],
    diagonal_right_top: [1,1],
    diagonal_left_bottom: [-1,-1],
    diagonal_left_top: [-1,1],
    diagonal_right_bottom: [1,-1]
  }

  attr_accessor :last_move

  def initialize(layout, last_move)
    @layout = layout
    @last_move = last_move
    @x_coord = last_move[0] || nil
    @y_coord = last_move[1] || nil
    @piece = @layout[@x_coord][@y_coord]
  end

  def check_for_win?
    check_for(:up,:down) ||
    check_for(:left,:right) ||
    check_for(:diagonal_right_top,:diagonal_left_bottom) ||
    check_for(:diagonal_left_top,:diagonal_right_bottom) 
  end

  private

    def check_for(direction1,direction2)
      connect_count = 1
      connect_count += count(direction1)
      connect_count += count(direction2)
      return true if connect_count >= 4
      false
    end

    def count(direction)
      direction_array = DIRECTIONS[direction]
      x_increment = direction_array[0]
      y_increment = direction_array[1]
      x_coord = @x_coord
      y_coord = @y_coord
      connect_count = 0
      found = true
      while found == true
        if x_coord + x_increment < 0 || y_coord + y_increment < 0 ||
            x_coord + x_increment >= 7||y_coord + y_increment >= 6
            found = false
        elsif @layout[x_coord + x_increment ][y_coord + y_increment] == @piece
          x_coord += x_increment
          y_coord += y_increment
          connect_count += 1
        else
          found = false
        end
      end
      connect_count
    end
end