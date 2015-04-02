class Player

  attr_accessor :choice

  def initialize( pid )
    @pid = pid
  end
  
  def beats?( opponent )
    if self.choice == 'R' && opponent.choice == 'S' || self.choice == 'P' && opponent.choice == 'R' || self.choice == 'S' && opponent.choice == 'P'
      true
    elsif self.choice == 'R' && opponent.choice == 'P' || self.choice == 'P' && opponent.choice == 'S' || self.choice == 'S' && opponent.choice == 'R'
      false
    end
  end

end