module ConnectFour
  class Column

    attr_reader :pieces, :max_length

    def initialize(height)
      @pieces = []
      @max_length = height      
    end
  end
end