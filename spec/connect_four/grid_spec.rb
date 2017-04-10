RSpec.describe Grid do
  let(:grid) { Grid.new }

  describe 'Connect Four grid initialized' do
    it 'has 7 columns' do
      expect(grid.grid.size).to eq 7
    end

    describe 'columns' do
      it 'has 6 spots' do
        grid.grid.each do |col|
          expect(col.size).to eq 6
        end
      end

      it 'each colomn spot is empty' do
        empty_space_char = Grid::EMPTY_SPOT
        grid.grid.each do |col|
          all_empty = col.select { |c| c == empty_space_char }
          expect(all_empty.size).to eq 6
        end
      end
    end
  end

  describe 'validating a move' do
    let(:column_choice) { 1 }

    context 'column is empty' do
      it 'returns true' do
        expect(grid.valid_move?(column_choice)).to be_truthy
      end
    end

    context 'column is partially full' do
      it 'returns true' do
        grid.grid[column_choice - 1][0] = 'R'
        grid.grid[column_choice - 1][0] = 'B'
        expect(grid.valid_move?(column_choice)).to be_truthy
      end
    end

    context 'column is full (no moves left)' do
      it 'returns false' do
        grid_column = grid.grid[column_choice - 1]
        6.times { |i| grid_column[i] = 'B' }

        expect(grid.valid_move?(column_choice)).to be_falsey
      end
    end
  end

  describe 'recording a move' do
    let(:player_disc) { 'R' }
    let(:player_col_choice) { 2 }

    context 'empty column' do
      it 'replaces first spot with player "disc"' do
        grid.record_move(player_col_choice, player_disc)
        expect(grid.grid[player_col_choice - 1].first).to eq player_disc
      end
    end

    it 'replaces first empty spot with player "disc"' do
      grid.grid[player_col_choice - 1][0] = 'R'
      grid.grid[player_col_choice - 1][1] = 'B'

      grid.record_move(player_col_choice, player_disc)
      expect(grid.grid[player_col_choice - 1][2]).to eq player_disc
    end
  end

  describe 'ending the game' do
    describe 'vertical winner' do
      context 'no vertical winner' do
        it 'returns false' do
          player_disc = 'R'
          expect(grid.winner?(player_disc)).to be_falsey
        end
      end

      context 'when winner' do
        before do
          2.times do
            grid.record_move(2, 'R')
          end

          4.times do
            grid.record_move(2, 'B')
          end
        end

        it 'returns true' do
          player_disc = 'B'
          expect(grid.winner?(player_disc)).to be_truthy
        end
      end
    end

    describe 'horizontal winner' do
      context 'no horizontal winner' do
        it 'returns false' do
          player_disc = 'R'
          expect(grid.winner?(player_disc)).to be_falsey
        end
      end

      context 'when winner' do
        let(:player_disc) { 'R' }
        before do
          (2..5).each do |i|
            grid.record_move(i, player_disc)
          end
        end

        it 'returns true' do
          expect(grid.winner?(player_disc)).to be_truthy
        end
      end
    end

    describe 'diagonal winner' do
      context 'no diagonal winner' do
        before do
          grid.record_move(2, 'R')
          grid.record_move(2, 'B')
          grid.record_move(3, 'B')
          grid.record_move(3, 'R')
        end
        it 'returns false' do
          expect(grid.winner?('R')).to be_falsey
        end
      end

      context 'when winner right to left' do
        let(:winning_disc) { 'B' }
        let(:losing_disc) { 'R' }
        before do
          grid.record_move(2, winning_disc)

          grid.record_move(3, losing_disc)
          grid.record_move(3, winning_disc)


          2.times { grid.record_move(4, losing_disc) }
          grid.record_move(4, winning_disc)


          3.times { grid.record_move(5, losing_disc) }
          grid.record_move(5, winning_disc)
        end

        it 'returns true' do
          expect(grid.winner?(winning_disc)).to be_truthy
        end
      end

      context 'when winner left to right' do
        let(:winning_disc) { 'B' }
        let(:losing_disc) { 'R' }
        before do
          grid.record_move(5, winning_disc)

          grid.record_move(4, losing_disc)
          grid.record_move(4, winning_disc)


          2.times { grid.record_move(3, losing_disc) }
          grid.record_move(3, winning_disc)


          3.times { grid.record_move(2, losing_disc) }
          grid.record_move(2, winning_disc)
        end

        it 'returns true' do
          expect(grid.winner?(winning_disc)).to be_truthy
        end
      end
    end

    describe '#tie' do
      context 'board is not full' do
        it 'returns false' do
          allow(grid).to receive(:full?) { false }
          expect(grid.tie?('R', 'B')).to be_falsey
        end
      end

      context 'board is full' do
        context 'when a winner' do
          it 'returns false' do
            allow(grid).to receive(:full?) { true }
            allow(grid).to receive(:winner?).and_return(false, true)
            expect(grid.tie?('R', 'B')).to be_falsey
          end
        end

        context 'when no winner' do
          it 'returns true' do
            allow(grid).to receive(:full?) { true }
            allow(grid).to receive(:winner?).and_return(false, false)
            expect(grid.tie?('R', 'B')).to be_truthy
          end
        end
      end
    end
  end

  describe '#to_s' do
    let(:expected_grid) {
      <<~GRID
         1 2 3 4 5 6 7
        ---------------
        |O|O|O|O|O|O|O|
        |O|O|O|O|O|O|O|
        |O|O|O|O|O|O|O|
        |O|O|O|O|O|O|O|
        |R|R|B|O|O|O|O|
        |R|B|R|O|O|O|O|
        ---------------
      GRID
    }

    before do
      grid.record_move(1, 'R')
      grid.record_move(1, 'R')
      grid.record_move(2, 'B')
      grid.record_move(2, 'R')
      grid.record_move(3, 'R')
      grid.record_move(3, 'B')
    end

    it 'prints a human readable grid to STDOUT' do
      expect(grid.to_s).to eq expected_grid
    end
  end
end
