class ConnectFour

  def initialize(ui:, grid:)
    @grid = grid
    @ui = ui
    @player1 = 'Player 1'
    @player2 = 'Player 2'

    @player = nil
  end

  def play
    ui.welcome
    ui.rules

    begin
      playing = set_player(@player)

      begin
        ui.display_grid(grid)
        move = ui.prompt_player_move
      end until grid.valid_move?(move)

      grid.record_move(move)
    end until winner? || tie?

    game_over(playing)
  end

  private

  attr_reader :ui, :grid, :player1, :player2
  attr_accessor :player

  def set_player(player)
    player == player1 ? player2 : player1
  end

  def game_over(playing)
    winner? ? ui.display_winner(playing, grid) : ui.display_tie(grid)
  end

  def winner?
    grid.winner?
  end

  def tie?
    grid.tie?
  end

end