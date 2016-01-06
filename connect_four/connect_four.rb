require_relative "./board.rb"
require_relative "./player.rb"

class ConnectFour
	attr_accessor :board

  def initialize
    @board = Board.new
    player1 = Player.new
    player2 = Player.new
    @players = [player1, player2]
    @playing = true
    play
  end

  def play
  	@players.shuffle!
    @players[0].choose_color
  	@players[0].color == 'red' ? @players[1].color = 'black' : @players[1].color = 'red'
  	index = 0
   
    while @playing 
      column = @players[index].choose_column
      team = @players[index].team_color
      @board.add_piece(team,column)
      puts @board.to_s
      #check for a win here
      #check if board is full (draw)
      switch_players
    end
  end

  def check_game_status

  end
  
  def switch_players(players_index)
    if players_index == 0
      return 1
    else 
      return 0
    end
  end
  
end

game = ConnectFour.new


