module ConnectFour
  class Game
    def initialize
      @board = Board.new
      welcome_message
      initialize_players
    end 

    def welcome_message
      puts "Welcome to connect four. How many players?"
    end

    def initialize_players
      input = gets.chomp
      if input == "1"
        @player1 = Human.new
        @player2 = Computer.new
      elsif input == "2"
        @player1 = Human.new
        @player1 = Human.new
      else
        puts "Please enter '1' or '2'."
        initialize_players
      end
    end

  end
end