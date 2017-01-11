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
    end until game_won?
  end

  def play_turn
    game_board.render
    player_move
    switch_player
  end

  def player_move
    game_board.drop_piece(players[whos_turn].choose, whos_turn)
  end

  def switch_player
    if whos_turn == 0
      self.whos_turn = 1
    else
      self.whos_turn = 0
    end
  end

  def game_won?
    false
  end
end
