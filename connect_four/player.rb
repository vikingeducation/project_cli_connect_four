module ConnectFour
  class Player
    attr_reader :piece
    
    def initialize(player_num)
      @player_num=player_num
      @piece = player_num==1 ? :X : :O
    end

    def turn
      
    end

  end  
end