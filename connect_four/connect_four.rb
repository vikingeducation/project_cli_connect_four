# connect4 heightxwidth = 6x7
# player
# human
# board
# game
# pieces
# later: computer
require_relative "board"
require_relative "player"
require_relative "piece"
require_relative "human"

class Connect_four

  def initialize
    names = get_players_names
    @board = Board.new
    @player1 = Human.new(names[0], "R", @board)
    @player2 = Human.new(names[1], "B", @board)
  end

  def get_players_names
    puts "player 1 name?"
      player1_name = gets.chomp
    puts "player 2 name?"
      player2_name = gets.chomp
    [player1_name, player2_name]
  end

  def play
    until win?
      @player1.make_move
      @player2.make_move
    end
  end

  def win?
    check_win(@board.horizontals)
    check_win(@board.verticals)
    check_win(@board.rising_diagonals)
    check_win(@board.falling_diagonals)
  end

  def full_board?
    @boards.horizontals.each do |row|
      if row.any? {|row| row == []}
        return false
      end
    end
    return true
  end


  def switch_players
  end

  def turn_over
  end

  def check_win(arrays)
    counter = 0
    arrays.each do |array|
      i = 0
      if !array[i+1]
        break
      elsif array[i].empty?
        counter = 0
      elsif array[i].color == array[i + 1].color
        i += 1
        counter += 1
      end
      counter == 3 ? true : false
    end
  end

end




# Your code here!