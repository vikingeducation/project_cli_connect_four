module ConnectFour
  class Human < Player
    def move 
      prompt
      x = get_move
      if valid_move?(x)
        x
      else
        puts "That is not a valid move."
        move
      end
    end

    def get_move
      gets.chomp
    end

    def prompt
      puts "Enter a column."
    end

    def valid_move?(move)
      Array("0".."6").include?(move)
      # Array("0".."6").include?(move) ? true : puts "That is not a valid move."
    end

  end
end