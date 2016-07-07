class Human < Player

  def get_column
    #loop
      # ask player for column number
      # validate input
  end

  def input_valid?(input)
    (1..7) === input.to_i
  end

end