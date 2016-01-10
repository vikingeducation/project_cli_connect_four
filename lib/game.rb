require_relative "./board.rb"
require_relative "./human.rb"
require_relative "./computer.rb"

class Game
  def initialize
    @board = Board.new
  end

  def ask_num_players
    puts "How many players (1 or 2)?"
    num_players = gets.chomp.to_i
    ask_num_players unless (1..2).include?(num_players)
    num_players
  end

  def play
  	player_setup
    game_loop
  end

  def player_setup
    player1 = Human.new
    ask_num_players == 1 ? player2 = Computer.new : player2 = Human.new

    @players = [player1, player2].shuffle!

    @players[0].choose_color
    if @players[0].team_color == 'red'
      @players[1].team_color = 'black'
    else
      @players[1].team_color = 'red'
    end

    @current_player_index = 0
  end

  def check_game_status
    status = @board.check_game_status
    case status
    when 'red'
      red_player = @players.index{|player| player.team_color == 'red'}
      @game_over_message = "#{@players[red_player].name} wins!"
    when 'black'
      black_player = @players.index{|player| player.team_color == 'black'}
      @game_over_message = "#{@players[black_player].name} wins!"
    when 'draw'
      @game_over_message = "Game ends in a draw!"
    end

    # stop playing if status is anything but false
    @playing = !status
  end

  def render
    system('clear')
    puts @board.to_s
    puts @game_over_message unless @playing
  end

  def handle_move
    column = @players[@current_player_index].choose_column
    team = @players[@current_player_index].team_color
    @board.add_piece(team,column)
  end

  def game_loop
    render
    @playing = true
    while @playing
      render
      check_game_status
      handle_move
      switch_players
    end
  end

  def switch_players
    @current_player_index == 0 ? index = 1 : index = 0
    @current_player_index = index
  end
end
