# public methods: marker, marker=, ==, to_s
# private methods : -
# test #initialize with default, x, 0
# test #== with other disk with same marker
# test #== with different marker disk
# test #to_s returns a string
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
