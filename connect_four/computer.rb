class Computer < Player

  def initialize(board, symbol)
    super(board, symbol)
    @name = "Skynet"
  end

  def get_move
    test_move = winning_move
    if test_move.nil?
      move = empty_columns.sample + 1
    else
      move = test_move + 1
    end
    @board.place_move(move, @symbol)
  end

  private

  def empty_columns
    (0..6).select{ |column| @board.spot_open?(column) }
  end

  def winning_move
    test_columns = @board.columns.to_a.deep_dup.to_h
    @move = nil

    empty_columns.each do |column|
      test_columns[column].push(@symbol)
      if @board.winning_combination?(@symbol, test_columns)
        @move = column
      end
      test_columns[column].pop
    end

    @move
  end
end