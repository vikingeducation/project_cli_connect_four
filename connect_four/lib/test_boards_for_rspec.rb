def test_vertical
  @board_arr[0][0] = "X"
  @board_arr[1][1] = "X"
  @board_arr[1][2] = "X"
  @board_arr[1][3] = "X"
#  @board_arr[1][4] = "X"
#  @board_arr[1][5] = "X"
end

def test_horizontal
  @board_arr[2][6] = "O"
  @board_arr[3][6] = "O"
  @board_arr[4][6] = "O"
  @board_arr[5][6] = "O"
end

def test_horizontal_fail
  @board_arr[2][6] = "O"
  @board_arr[3][6] = "O"
  @board_arr[4][6] = "O"
  @board_arr[5][6] = "X"
  @board_arr[6][6] = "O"
end

def test_diagonal
  @board_arr[3][1] = "Y"
  @board_arr[2][2] = "Y"
  @board_arr[1][3] = "Y"
  @board_arr[0][4] = "Y"
end

def test_draw
  @board_arr.each do |row|
    row.map! { |n| n = "*"}
  end
end
