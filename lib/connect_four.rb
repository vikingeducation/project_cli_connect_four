=begin
 initialize get_players_names
 play winning_message
 player_moves win
 full_board check_win
=end

require_relative "./connect_four/board"
require_relative "./connect_four/player"
require_relative "./connect_four/piece"
require_relative "./connect_four/human"

class ConnectFour

  def initialize(board = nil)
    names = get_players_names
    @board = board || Board.new
    @player1 = Human.new(names[0], "R", @board)
    @player2 = Human.new(names[1], "B", @board)
    @current_player = @player1
  end

  def get_players_names
    puts "What is your name, player 1?"
    player1_name = gets.chomp
    puts "What is your name, player 2?"
    player2_name = gets.chomp
    [player1_name, player2_name]
  end

  def play
    loop do
      player_moves(@player1)
      player_moves(@player2)
    end
  end

  def winning_message(player)
    puts "You win #{player.name}! Thanks for playing."
    exit
  end

  def player_moves(player)
    player.make_move
    @board.render_board
    winning_message(player) if win?
  end


  def win?
    check_win(@board.horizontals) ||
    check_win(@board.verticals) ||
    check_win(@board.rising_diagonals) ||
    check_win(@board.falling_diagonals)
  end

  def full_board?
    @board.horizontals.each do |row|
      if row.any? {|row| row == []}
        return false
      end
    end
    return true
  end


  # def check_win(arrays)
  #   counter = 0
  #   arrays.each do |array|
  #     i = 0
  #     if !array[i+1]
  #       break
  #     elsif array[i].empty?
  #       counter = 0
  #     elsif array[i].color == array[i + 1].color
  #       i += 1
  #       counter += 1
  #     end
  #     counter == 3 ? true : false
  #   end
  # end

  def check_win(arrays)
    arrays.each do |array|
      counter_r = 0
      counter_b = 0
      array.each do |space|
        if space.empty?
          counter = 0
        elsif space.color == "R"
          counter_r += 1
        elsif space.color == "B"
          counter_b += 1
        end
      end
      return true if (counter_r == 4 || counter_b == 4)
    end
    return false
  end


end


#ConnectFour.new.play
