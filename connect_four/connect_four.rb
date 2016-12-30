require_relative 'board'
require_relative 'players'

class ConnectFour
  def initialize
    @board = Board.new
    @player1 = Human.new('Player 1', 'x')
    @board.render
  end

  def play
    welcome
    get_mode
    create_players
    @current_player = [@player1, @player2].sample

    run_game

  end

  private

  def run_game
    @board.render
    until @board.full?
      @current_player.get_move(@board)
      @board.update(@current_player)
      @board.render
      if @board.game_won?
        congratulations
        exit
      end
      switch_players
      reset_round
    end
  end

  private

  def congratulations
    puts "Congratulations, #{@current_player.name}!"
    puts "You've won!"
  end

  def reset_round
    @player1.reset_moves
    @player2.reset_moves
  end

  def switch_players
    @current_player = @current_player == @player1? @player2 : @player1
  end

  def create_players
    @player2 = Human.new if @mode == '1'
    @player2 = AI.new if @mode == '2'
  end

  def get_mode
    until @mode == '1' || @mode == '2'
      puts "Enter '1' to play against a friend, '2' to play against the computer"
      @mode = gets.strip
      exit if @mode == 'q'
    end
    puts "You have chosen to play against a friend. May the best friend win!" if @mode == '1'
    puts "You have chosen to play against me. All the best!" if @mode == '2'
  end

  def welcome
    puts "Welcome to Connect Four!"
  end
end


c = ConnectFour.new
c.play
