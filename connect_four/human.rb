class Human

  def initialize(board, piece)
    @board = board
    @piece = piece
  end

  def turn
    print "Pick a column to drop your piece (1-7) or q to quit: "
    response = pick_a_column
    @board.add_piece_to_board(response, @piece)
  end

  def set_mode
    print "1 or 2 player mode (type 1 or 2 then press enter): "
    response = pick_a_mode
  end

  private

  def get_valid_column(response)
    response = response.to_i
    valid_column_number = (1..7).to_a
    until (valid_column_number.include? response) && (@board.does_column_have_space?(response))
      puts "Invalid Selection!"
      print "Pick a column from 1 to 7 that has space: "
      response = respond.to_i
    end
    response
  end

  def get_valid_mode(response)
    valid_mode = ['1', '2']
    until valid_mode.include? response
      puts "Invalid Selection!"
      print "1 or 2 player mode (type 1 or 2 then press enter): "
      response = respond
    end
    response
  end

  def pick_a_column
    response = respond
    response = get_valid_column(response)
  end

  def pick_a_mode
    response = respond
    response = get_valid_mode(response)
  end

  def respond
    response = gets.chomp
    exit if response == 'q'
    response
  end

end