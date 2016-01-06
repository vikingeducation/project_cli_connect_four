class Computer < Player

  def select_move
    [1..7].sample
  end

end