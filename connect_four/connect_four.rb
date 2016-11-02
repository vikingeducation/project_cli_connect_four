require_relative "prompt"

class ConnectFour

  def initialize
    @board = Board.new
    @p1 = Player.new
    @p2 = Player.new
  end

  def run

    # show board
      # board => display
    # Display.render_board(@board)

    # first player is p1
    current_player = @p2

    # loop until win or draw
    unless win? || draw?

      current_player = (current_player == @p1) ? @p2 : @p1
      # ask for user move
        # validate user input
      input = Prompt.get_input

      # validate user move (legal move)
      # update board
      # @board.update(input, @p1) if @board.valid_move?(input)
        # out of top/no more space in col (handled in Board)

      # check for win

      # @board.check_for_win(current_player)
        # horizontal
        # vertical
        # diagonal


      # show board
        # board => display
      # Display.render_board(@board)
    end # unless loop

    # Display.game_won(color) if win?

    # Display.game_draw(color) if draw?

    # play_again?
  end # run method

  def win?
    false
  end

  def draw?
    false
  end

  def play_again?
  end

end

# test
t = ConnectFour.new
t.run

