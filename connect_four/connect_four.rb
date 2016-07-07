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

class ConnectFour

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
      p @player1.make_move
      p @player2.make_move
    end
  end

  def win?
    check_win(@board.horizontals)
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
      counter = 0
      array.each do |space|
        if space.empty?
          counter = 0
        else
          counter += 1
        end
      end
      return true if counter == 4
    end
    return false
  end
  

end


# Your code here!