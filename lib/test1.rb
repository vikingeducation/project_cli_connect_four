require_relative 'board'

def test_board
  board = Board.new


  (0..6).each do |col|
    3.times do

      if col.even?
        board.add_piece('r', col)
        board.add_piece('b', col)
      else
        board.add_piece('b', col)
        board.add_piece('r', col)
      end
    end

  end
  board.render
  board
end

p test_board.board