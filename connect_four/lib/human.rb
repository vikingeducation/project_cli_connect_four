=begin
  public methods:
    - initialize
    - turn
    - set_mode

  private methods:
    - get_valid_column(response)
    - get_valid_mode(mode)
    - pick_a_column
    - pick_a_mode
    - respond
=end

class Human

  def initialize(board, piece)
    @board = board
    @piece = piece
  end

  def turn
    print " - Pick a column to drop your piece (1-7) or q to quit: "
    @board.add_piece_to_board(pick_a_column, @piece)
  end

  def set_mode
    print "1 or 2 player mode (type 1 or 2 then press enter): "
    pick_a_mode
  end

  private

  def get_valid_column(response)
    column = response.to_i
    valid_column = (1..7).to_a
    until (valid_column.include? column) && (@board.does_column_have_space?(column))
      puts "Invalid Selection!"
      print "Pick a column from 1 to 7 that has space: "
      column = respond.to_i
    end
    column
  end

  def get_valid_mode(mode)
    valid_mode = ['1', '2']
    until valid_mode.include? mode
      puts "Invalid Selection!"
      print "1 or 2 player mode (type 1 or 2 then press enter): "
      mode = respond
    end
    mode
  end

  def pick_a_column
    get_valid_column(respond)
  end

  def pick_a_mode
    get_valid_mode(respond)
  end

  def respond
    response = gets.chomp
    exit if response == 'q'
    response
  end

end