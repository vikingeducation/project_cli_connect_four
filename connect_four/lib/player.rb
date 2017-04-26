class Player
  attr_accessor :board, :piece
  # initialize
  def initialize(board)
    @piece = ""
    @board = board.board_arr
  end

  def def_piece(input)
    if val_piece(input)
      @piece = input
    else
      puts "please select a symbol or letter, (not a number)"
    end
  end

  def place_piece(selection)
    if val_input(selection)
      row_position = 0
      while @board[selection][row_position + 1] == "-"
        row_position += 1
      end
      @board[selection][row_position] = @piece
    end
  end

  def get_select
    loop do
      input = gets.chomp
      selection = (input.to_i - 1)
      if val_input(selection)
        return selection
        break
      else
        puts "Choose a number between 1 and 7, and a column which is not full!"
      end
    end
  end

  def ai_selection
    loop do
      input = Random.new.rand(1..7)
      if val_input(input)
        return input
      end
    end
  end

  def find_matches(matches, prev, piece)
    if piece == "-"
      prev = ""
    end
    if piece == prev
      matches += 1
    end
    prev = piece
  end

  private

  # val_piece
  def val_piece(input)
    # Checks to see if input for piece value is valid
    input.is_a?(Integer) || input.length > 1 ? false : true
  end

  def val_input(input)
    if input.between?(0,6) && @board[input][0] == "-"
      true
    else
      false
    end
  end
end
