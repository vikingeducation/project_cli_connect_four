class Computer < Player

  def get_response
    response = @@valid_answers[rand(3)]
  end

end