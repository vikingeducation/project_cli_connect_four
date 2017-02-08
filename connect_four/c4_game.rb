class ConnectFourGame
  attr_accessor :game_board, :players, :whos_turn
  def initialize
    @game_board = ConnectFourBoard.new
    @players = []
    @whos_turn = 0
  end

  def self.start
    Gui.welcome
    num_of_players = Gui.num_of_players
    new_game = ConnectFourGame.new
    new_game.generate_players(num_of_players)
    new_game.play
  end

  def generate_players(num)
    generate_1p_game if num == 1
    generate_2p_game if num == 2
  end

  def generate_1p_game
    players << HumanPlayer.new
    players << CpuPlayer.new
  end

  def generate_2p_game
    2.times do
      players << HumanPlayer.new
    end
  end

  def play
    begin
      play_turn
      break if game_won?
    end until game_over?
  end

  def play_turn
    choice = 0
    begin
      game_board.render
      choice = players[whos_turn].choose
    end until game_board.validate_col(choice)

    player_move(choice)
    nil
  end

  def player_move(choice)
    game_board.drop_piece(choice, whos_turn)
    switch_player
    nil
  end

  def switch_player
    self.whos_turn = if whos_turn == 0
                       1
                     else
                       0
                     end
    nil
  end

  def game_won?
    who_won?(check_horizontal || check_vertical || check_diagonal)
  end

  def who_won?(player_piece)
    if player_piece
      Gui.end_game(players[0].player_name) if player_piece == 'O'
      Gui.end_game(players[1].player_name) if player_piece == 'X'
      game_board.render
      return true
    else
      return false
    end
  end

  def game_over?
    game_board.board.each do |row|
      row.each do |slot|
        return false if slot == '-'
      end
    end
    true
  end

  def end_game
    Gui.end_game
    Exit
  end

  def check_horizontal
    board = @game_board.board
    board_size = board.size - 1
    horizontals = []
    0.upto(board_size) do |i|
      inner_board_size = board[i].length - 1
      0.upto(inner_board_size) do |j|
        break if j + 3 > inner_board_size
        4.times do
          horizontals << board[i][j].to_s + board[i][j + 1].to_s + board[i][j + 2].to_s + board[i][j + 3].to_s
        end
      end
    end

    return check_plays(horizontals)
  end

  def check_vertical
    board = @game_board.board
    board_size = board.size - 1
    verticals = []
    0.upto(board_size) do |i|
      break if i + 3 > board_size
      inner_board_size = board[i].length - 1
      0.upto(inner_board_size) do |j|
        to_match = board[i][j].to_s + board[i + 1][j].to_s + board[i + 2][j].to_s + board[i + 3][j].to_s
        verticals << to_match
      end
    end

    return check_plays(verticals)
  end

  def check_diagonal
    board = @game_board.board
    board_size = board.size - 1
    diagonals = []
    0.upto(board_size) do |i|
      inner_board_size = board[i].length - 1
      0.upto(inner_board_size) do |j|
        to_match = ''
        0.upto(3)  do |k|
          unless board[i + k].nil? || board[i + k][j + k].nil?
            to_match += board[i + k][j + k]
          end
        end
        diagonals << to_match if to_match.length == 4

        to_match = ''
        0.upto(3)  do |k|
          unless board[i + k].nil? || board[i + k][j - k].nil?
            to_match += board[i + k][j - k]
          end
        end

        diagonals << to_match if to_match.length == 4
      end
    end

    return check_plays(diagonals)
  end

  def check_plays(play_array)
    return play_array.include?('XXXX') ? 'X' : play_array.include?('OOOO') ? 'O' : false
  end
end
