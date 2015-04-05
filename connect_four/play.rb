Dir[File.dirname(__FILE__)+'/*.rb'].each{ |f| require f }

def player_loop
  choice=nil
  puts "Welcome to Connect Four!"
  puts ""
  loop do
   puts "#################################################"
   puts "Select the game number that you'd like to play:"
   puts "1)Single player VS. AI\n2)Two player"
   puts " #################################################"
   choice=gets.chomp.to_i  
    return choice if (choice==1 || choice==2)
  end
end
p=player_loop
game=ConnectFour.new(p)
game.play