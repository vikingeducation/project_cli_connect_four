module ConnectFour
  class Disk
    attr_accessor :marker
    def initialize(marker = nil)
      @marker = marker
    end

    def ==(other)
      marker == other.marker
    end

    def to_s
      @marker ? "\t" + @marker.to_s + "\t" : "\t-\t"
    end
  end
end