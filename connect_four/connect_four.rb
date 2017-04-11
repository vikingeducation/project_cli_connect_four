class ConnectFour
  Player = Struct.new(:name, :disc)

  def initialize(ui:, grid:)
    @grid = grid
    @ui = ui
    @player1 = Player.new('Player 1', 'R')
    @player2 = Player.new('Player 2', 'B')

    @player = nil
  end

  def play
    ui.welcome
    ui.rules

    loop do
      set_player

      begin
        ui.display_grid(grid)
        move = ui.prompt_player_move(player.name)
      end until grid.valid_move?(move)

      grid.record_move(move, player.disc)
      break if grid.full? || winner?
    end

    game_over
  end

  private

  attr_reader :ui, :grid, :player1, :player2
  attr_accessor :player

  def set_player
    @player = @player == @player1 ? @player2 : @player1
  end

  def game_over
    winner? ? ui.display_winner(player, grid) : ui.display_tie(grid)
  end

  def winner?
    grid.winner? @player.disc
  end
end