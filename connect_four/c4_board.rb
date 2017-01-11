class ConnectFourBoard
  attr_accessor :board
  def initialize
    @board = build_empty_game_array
  end

  def render
    puts
    board.each do |row|
      row.each do |slot|
        print slot + ' '
      end
      puts
    end

    render_selection_line
    puts
  end

  def render_selection_line
    board[0].size.times do |sel|
      print sel.to_s + ' '
    end
    puts
  end

  def drop_piece(col, whos_turn)
    depth = board.size - 1
    depth.downto(0) do |row|
      if board[row][col] == '-'
        board[row][col] = 'X' if whos_turn % 2 != 0
        board[row][col] = 'O' if whos_turn % 2 == 0
        return
      end
    end
  end

  private

  def first_row
    board[0]
  end

  def build_empty_game_array(board_height = 6, board_width = 7)
    Array.new(board_height) { Array.new(board_width) { |_i| _i = '-' } }
  end
end
