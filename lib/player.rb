module ConnectFour

  class Player
    attr_reader :name,
                :marker

    # store a local reference to the game grid
    attr_accessor :grid

    def initialize(name, marker)
      @name = name
      @marker = marker
      @grid = nil
    end
  end
end