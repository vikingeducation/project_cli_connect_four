module ConnectFour
  class Human < Player
    def turn 
      prompt
      move = get_move
      move if valid_move?(move)
    end

    def get_move
      gets.chomp
    end

    def valid_move?(move)
      Array("0".."6").include?(move)
    end

    def prompt
      puts "Enter a column."
    end
  end
end