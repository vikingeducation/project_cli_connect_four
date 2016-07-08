require 'game'

describe Game do

  describe "#game_over?" do
    it "returns true if board is full" do
      #fill up board without winning
      (0..6).each do |col|
        6.times do
      
          if col.even?
            board.add_piece('r', col)
            board.add_piece('b', col)
          else
            board.add_piece('b', col)
            board.add_piece('r', col)
          end

        end
      end

      expect(game_over?).to eq(true)

    end
  end
  
end