class Human < Player

  def ask_for_response
    print "Type r, p or s then press enter (or q to quit): "
    response = gets.chomp.downcase
    until response_is_valid?(response)
      puts "Invalid decision!"
      print "Type 'r' for rock, 'p' for paper or 's' for scissors then enter (or q to quit): "
      response = gets.chomp.downcase
    end
    response
  end

  def set_mode
    print "Type 1 to play against computer or 2 to play against another person (or q to quit) and then press enter: "
    response = gets.chomp
    until mode_is_valid?(response)
      puts "Invalid decision!" 
      print "Type 1 to play against computer or 2 to play against another person (or q to quit) and then press enter: "
      response = gets.chomp
    end
    response
  end

  private

  def mode_is_valid?(response)
    exit if response == 'q'
    ['1', '2'].include? response
  end

  def response_is_valid?(response)
    exit if response == 'q'
    @@valid_answers.include? response
  end

end