class Disk

  attr_reader :owner
  def initialize(owner)
    @owner = owner
  end

  private_class_method :new

  #factory methods
  def self.make_player_1_disk
    new( "1" )
  end

  def self.make_player_2_disk
    new( "2" )
  end

end
