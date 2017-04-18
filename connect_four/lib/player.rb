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

  # select_row
  def select_col(input)
    selection = (input.to_i - 1)
    if val_input(selection)
      row_position = 0
      while @board[selection][row_position + 1] == "-"
        row_position += 1
      end
      @board[selection][row_position] = @piece
    end
  end

  def ai_select_col
    options = []
    (0..6).each do |col|
      (0..6).to_a.reverse.each do |row|
        if @board[col][row] == "-"
          next
        end
        puts "Column #{col}, Row #{row}: #{@board[col][row]}"
        #creates a string

        #adds that string to an array
      end
    end
    # evaluates possible moves, first for horiztonal matches

    # if row contains
  end

  private
  # AI
  # def

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
