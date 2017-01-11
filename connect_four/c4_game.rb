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
    false
  end

  def game_over?
    game_board.board.each do |row|
      row.each do |slot|
        return  false if slot == '-'
      end
    end
    return true
  end
end
