module ConnectFour

  class Player
    attr_reader :name,
                :marker

    def initialize(name, marker)
      @name = name
      @marker = marker
    end

    # asks player which column to place his marker in
    def ask_for_move
    end
  end

end