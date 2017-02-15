module ConnectFour

  class Game
    def initialize
      @grid = Grid.new

      # how best to initialize players?
    end

    # main game method
    def play
    end

    def game_over?
      victory? || draw?
    end

    def victory?
    end

    def draw?
    end

    def switch_players
    end

    def welcome_message
    end
  end
  
end