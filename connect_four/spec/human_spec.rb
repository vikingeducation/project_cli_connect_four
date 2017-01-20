# Tests for Human class
# # spec/human_spec.rb
# require 'player'
# require 'human'
# include Connect_Four

# describe Human do
#   let(:human){ Human.new("HumanPlayer", :y, Array.new(2){Array.new(3)})  }
  

#   describe '#initialize' do
#     it 'raises an ArgumentError with incorrect number of arguments' do
#       expect{ Human.new("test", :y)}.to raise_error(ArgumentError)
#     end

#     it 'creates a new player with a name' do
#       expect(human.name).to eq("HumanPlayer")
#     end
#   end

#   describe '#gets_coordinates' do
    
#     allow(human).to receive(:gets).and_return("3,2")
#     expect(human.ask_for_coordinates).to eq([3,2])
#   end


#   # describe 'computer generated coordinates' do
#   #   it 'create random x coordinate' do
#   #     expect(0..5).to cover(computer.create_coordinates[0])
#   #   end

#   #   it 'create random y coordinate' do
#   #     expect(0..5).to cover(computer.create_coordinates[1])
#   #   end
#   # end
# end