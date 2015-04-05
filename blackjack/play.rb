require './blackjack.rb'

def player_loop
  choice=nil
  puts "Welcome to Blackjack!"
  puts ""
  loop do
   puts "How much money would you like to start with?"
   choice=gets.chomp.to_i  
    return choice if choice > 0
  end
end

Blackjack.new(player_loop).play
