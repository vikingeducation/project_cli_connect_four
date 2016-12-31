class Player
  attr_reader :piece, :name

  def initialize(name='Player 2', piece='o')
    @name = name
    @piece = piece
    @move = ''
  end

  def reset_moves
    @move = ''
  end

  def get_move(board)
    # accept board so that we can verify the validity of the
    until valid_format? && board.valid_move?(move)
      prompt_move(board)
    end
  end

  def move
    # make sure we pass it in a format that 'board' understands
    @move - 1
  end

  private


  def valid_format?
    !@move.nil? && @move.to_s.length == 1
  end

end

class AI < Player

  def move
    @move
  end

  private

  def prompt_move(board=nil)
    @board = board
    @b = @board.board
    @move = winning_move ? winning_move : rand(0..5)
  end

  def winning_move
    (0...@b.size).each do |y|
      @b[y] << @piece
      if @board.game_won? && @b[y].size < 6
        @b[y].pop
        return y
      end
      @b[y].pop
      @b[y] << 'x'

      if @board.game_won? && @b[y].size < 6
        @b[y].pop
        return y
      end
      @b[y].pop
    end
    false
  end

end
class Human < Player

  private

  def prompt_move(board=nil_)
    puts "Enter column (1-6) in which you'd like to place your piece. Enter '1' for column 1, '2' for column 2 and so on."
    print "#{@name}: "
    @move = gets.strip
    exit if @move == 'q'
    @move = @move.to_i
    puts
    puts "Please check the format of your move."  unless valid_format?
  end


end
