module ConnectFour
  class Human < Player
    def turn 
      prompt
      move = get_move
    end

    def get_move
      gets.chomp
    end

    def prompt
      puts "Enter a column."
    end
  end
end