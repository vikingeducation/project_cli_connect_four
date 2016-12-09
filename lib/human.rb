require_relative 'board'
require_relative 'player'
require 'pry'

class Human < Player

  def choose_column
    player_choice = ""
    puts 
    puts "Player #{@number}:" 
    puts "In which column will you drop your piece?"
    player_choice = gets.chomp.strip.to_i
    until valid_choice? (player_choice)
      puts "Try again! Bad input."
      player_choice = gets.chomp.strip.to_i
    end
    player_choice -= 1
    @board.process_choice(player_choice, @piece)
  end


  def valid_choice?(player_choice)
    return true if (1..7).include?(player_choice) &&
                    @board.columns[player_choice - 1].include?('-')
    false
  end


end