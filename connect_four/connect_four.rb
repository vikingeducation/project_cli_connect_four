load 'player.rb'
load 'board.rb'

class ConnectFour

  def initialize
    @board = Board.new
    game_mode
  end
  
  def game_mode
    puts "Do you want to play against the"
    puts "computer or another person?"
    print "Enter '1' for computer or '2' for person."
    loop do
      input = gets.chomp
      if valid_mode?(input)
        setup_game(input)
        break
      end
    end
  end

  def setup_game(mode)
    @player_1 = Human.new(:r)
    @current_player = @player_1
    case mode
    when "1"
      @player_2 = AI.new(:y)
    when "2"
      @player_2 = Human.new(:y)
    end
  end

  def valid_mode?(input)
    if input == "1" || input == "2"
      return true
    else
      puts "Invalid Selection!"
    end
  end

  def game_end?
    victory? || draw?
  end

  def draw?
    if @board.full?
      @board.render_board
      puts "Board is full! Game Over!"
      exit
    end
  end

  def victory?
    if @board.winning_line?(@current_player.piece)
      @board.render_board
      puts "#{@current_player.name} wins!"
      exit
    end
  end

  def game_loop
    loop do
      @board.render_board
      @current_player.get_move(@board)
      break if game_end?
      switch_player
    end  
  end

  def switch_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end   
  end
end

go = ConnectFour.new
go.game_loop