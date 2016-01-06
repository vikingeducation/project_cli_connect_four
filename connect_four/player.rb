class Player
  
  def initialize(type,color)
  	@type = type
	@color = color
  end

  def self.build_human_player(color)
	  new(:human,color)
  end

  def self.build_computer_player(color)
	new(:computer,color)
  end

end	