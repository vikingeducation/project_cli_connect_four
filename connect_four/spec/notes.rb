=begin

Board
  game_board
  game_board=(new_game_board)
  get_move_array(move_col)
  atleast_one_row_empty?(move_col)
  straight_win?(array, move, color)
  check_board_full?

  private

  check_diagonals(diagonal_array, array, color, move)
  horizontal_vertical_win?(array, color)

  ======================================
  create test boards at beginning
    board with winning horizontal
    board with winning diagonal
    board with winning vertical
    empty board
    full board with draw

  test game_board initialization
    put in ROWS and COLUMNS

  test get_move_array(move_col)
    if move_col column is full
      it should return nil
    if move_col column is not full
      it should return[row, move_col]

  test atleast_one_row_empty?(move_col)
    if move_col column is full
      it should return false
    if move_col column is not full
      it should return true

  test straight_win?(array, move, color)
    if array has diagonal win on red
      it should return true
    if array has horizontal win on red
      it should return true
    if array has vertical win on red
      it should return true
    if array does not have a win on red
      it should return false
    if array has diagonal win on green
      it should return true
    if array has horizontal win on green
      it should return true
    if array has vertical win on green
      it should return true
    if array does not have a win on green
      it should return false

    test check_board_full?
      if array is full
        return true
      if array is not full
        return false

    test check_diagonals(diagonal_array, array, color, move)
      


=end