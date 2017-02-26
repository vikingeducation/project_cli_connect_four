=begin
  Public interface:
    Readers:
      name
      marker
    
    Accessors:
      grid

    initialize

  Private methods:
    n/a

  Test paths:
    initialize
      - test that instance variables are correctly set

    name, marker, grid
      - test that it returns the same value initially set 

    grid=
      - test that the grid can be set
=end

module ConnectFour

  class Player
    attr_reader :name,
                :marker

    # store a local reference to the game grid
    attr_accessor :grid

    def initialize(name, marker)
      @name = name.to_s
      @marker = marker.to_s
      @grid = nil
    end
  end
end