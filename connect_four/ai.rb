class Tachikoma
  
  attr_accessor :color, :pid
  
  def initialize( color )
    @color = color
    @pid = "Tachikoma"
  end
  
  def get_move
    move = rand(0..5)
    puts ""
    puts "Tachikoma picks column #{move + 1}!"
    
    move
  end
  
end