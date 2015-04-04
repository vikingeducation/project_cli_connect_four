require './connect_four.rb'

puts "Would you like to play connect four with one players or two?"
user_input = gets.chomp.downcase

if user_input == "1"
  cfour = ConnectFour.new(7, 6, 1)
  cfour.play
elsif user_input == "2"
  cfour = ConnectFour.new(7, 6, 2)
  cfour.play
else
  puts "You didn't listen to me!"
end