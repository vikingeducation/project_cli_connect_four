module ConnectFour
  class Human < Player
    def move 
      prompt
      choice = get_move
      until valid_move?(choice)
        puts "That is not a valid move."
        choice=gets.chomp
      end
      choice
    end

    def get_move
      gets.chomp
    end

    def prompt
      puts "Player #{@player_num}: Enter a column."
    end

    def valid_move?(move)
      Array("1".."7").include?(move)
    end

  end
end