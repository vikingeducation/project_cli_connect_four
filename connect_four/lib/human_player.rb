# require './player.rb'

class HumanPlayer < Player
  def choose_column
    input = "error"
    loop do
      puts "Pick column 1 to 7."
      input = gets.chomp.to_i
      break if (1..7).include?(input)
      puts "Invalid input."
    end
    input
  end 
end
