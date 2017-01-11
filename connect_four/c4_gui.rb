class Gui
  def self.welcome
    puts 'Welcome to Connect Four!'
  end

  def self.goodbye
    puts "\n Thanks for playing!"
  end

  def self.num_of_players
    begin
      puts 'How many players?'
      puts '1. Single Player vs CPU'
      puts '2. Two Player game'
      print '> '
      num_p = gets.chomp.to_i
    end until num_p == 1 || num_p == 2

    return num_p
  end

  def self.get_name
    puts 'What is your name?'
    print '> '
    name = gets.chomp
    name
  end

  def self.get_player_choice
    puts 'Please enter where to drop the piece!'
    puts 'Enter: 0 - 6'
    print '> '
    choice = gets.chomp.to_i
    choice
  end

  def self.annouce_who(player)
    puts "It is now #{player}'s turn!"
  end
end
