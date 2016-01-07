class Player
  
  attr_accessor :color

  def initialize(color)
	  @color = color
  end


  def self.build_human_player(color)
	  Human.new(color)
  end


  def self.build_computer_player(color)
	  Computer.new(color)
  end



end	