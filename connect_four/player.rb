class Player
  def placement
    puts "Enter the column in which you want to place a piece"
    get.strip.to_i
  end
end