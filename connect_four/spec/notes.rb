

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
    board with winning forwardslash diagonal 
    board with winning backslash diagonal
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
      if forward array has move in it and board wins
        return true
      if forward array has move in it and board loses
        return false
      if backslash array has move in it and board wins
        return true
      if backslash array has move in it and board loses
        return false

    test horizontal_vertical_win?(array, color)
      if array has 4 in a row
        return true
      if array has 0-3 in a row
        return false


======================================
Computer
  player_move

  initialize with color and without

  test player_move
    make sure it returns column between 0 & 6


======================================
Human
  initialize with color and without

  player_move

  test player_move
    spoof user input with:
    allow(player).to receive(:gets).and_return("1")
    make sure we get an integer back

    try invalid input, make sure we do not get an integer back
  

======================================  
Player
  initialize
  self.build_human_player
  self.build_computer_player

  test attr_accessor :color

  test initialize
    not pass a color returns an ArgumentError
    passing a color initializes Player.new

  test self.build_human_player
    not pass a color returns an ArgumentError
    passing a color initializes Human.new


  test self.build_computer_player
    not passing a color returns an ArgumentError
    passing a color initializes Computer.new


======================================  
ConnectFour
  initialize
  play

  private
  print_instructions (just puts, do not test this one)
  ask_player_type
  switch_player
  add_move

  test initialize
    make sure we get ConnectFour.new with attributes

  test play
    how do we test lots of methods coming together?

  test ask_player_type
    spoof user input with:
    allow(player).to receive(:gets).and_return("computer")  
        make sure @player2 is Computer.new
    allow(player).to receive(:gets).and_return("human")  
        make sure @player2 is Human.new
    allow(player).to receive(:gets).and_return("incorrect")  
        make sure @player2 is nil


  test switch_player
    @current_player == @player_1 returns @current_player = @player_2
    @current_player == @player_2 returns @current_player = @player_1


  test add_move
    board with empty spot should switch nil to color
