class WinJudge
  DIRECTIONS = {
    right: [1, 0],
    left: [-1, 0],
  }

  def initialize(layout, last_move)
    @layout = layout
    @last_move = last_move
    @x_coord = last_move[0] || nil
    @y_coord = last_move[1] || nil
    @piece = @layout[@x_coord][@y_coord]
  end

  def check_for_win?
    check_for_horizontal
    # check_for_horizontal ||
    # check_for_diagonal_1 ||
    # check_for_diagonal_2
    #one function for each direction of diagnonal1, diagonal2, up and down. 

    #one diagonal will be index[in+1][in+1] index[in-1][in-1]

    #two diagonal will be index[in+1][in-1] index[in-1][in+1]

    #store last move with global variable
  end

  def check_for_horizontal
    connect_count = 1
    connect_count += count(:up)
    connect_count += count(:down)
    return true if connect_count >= 4
    false
  end

  # def self.count_up(layout, piece, x_coord, y_coord)
  #   connect_count = 0
  #   found == true
  #   while found == true
  #     if layout[x_coord + 1 ][y_coord] == piece
  #       x_coord += 1 
  #       connect_count += 1
  #     else
  #       found == false
  #     end
  #   end
  #   connect_count
  # end

  def count(direction)
    direction_array = DIRECTIONS[direction]
    x_increment = direction_array[0]
    y_increment = direction_array[1]
    x_coord = @x_coord
    y_coord = @y_coord
    connect_count = 0
    found = true
    while found == true
      if @layout[x_coord + x_increment ][y_coord + y_increment] == @piece
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