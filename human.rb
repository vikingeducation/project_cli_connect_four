require_relative 'board'
require_relative 'player'
require 'pry'

class Human < Player

  def choose_column
    player_choice = ""
    puts 
    puts "In which column will you drop your piece?"
    puts "Please enter the column number (1-7) such that column 1 would be input as '1'."
    player_choice = gets.chomp.strip.to_i
    until valid_choice? (player_choice)
      puts "Try again! Bad input."
      player_choice = gets.chomp.strip.to_i
    end
    binding.pry
    @board.process_choice(player_choice, @piece)
  end


  def valid_choice?(player_choice)
    return true if (1..7).include?(player_choice) &&
                    @board.columns[player_choice - 1].include?('-')
    false
  end


end

#bb = Board.new
#me = Human.new(bb, "O")
#me.choose_column