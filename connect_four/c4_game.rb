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
      if game_won?
        Gui.end_game
        game_board.render
        puts
        break
      end
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
    if whos_turn == 0
      self.whos_turn = 1
    else
      self.whos_turn = 0
    end
    nil
  end

  def game_won?
    return check_horizontal
  end

  def game_over?
    game_board.board.each do |row|
      row.each do |slot|
        return  false if slot == '-'
      end
    end
    return true
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


    return true if horizontals.include?("XXXX") || horizontals.include?("OOOO")
    return false
  end
end
