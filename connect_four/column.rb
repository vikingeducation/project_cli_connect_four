module ConnectFour
  class Column

    attr_reader :pieces

    def initialize
      @pieces = []
      @max_length = 6      
    end
  end
end