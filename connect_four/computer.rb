class Computer < Player


  def select_move
    (1..7).to_a.sample
  end

end