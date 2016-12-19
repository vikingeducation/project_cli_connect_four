require "human"

describe Human do

	describe '#initialize' do

		describe 'arguments' do
    	
	    	it 'should raise error without argument' do
	      		expect{Human.new}.to raise_error(ArgumentError)
	    	end

	    	it 'should be able to take one argument' do
	      		expect{Human.new(1)}.not_to raise_error
	    	end
	    end

	    describe 'instance varibale' do

	    	it 'should set good instance variables' do
	      		expect(Human.new(2).color).to eq(2)
	      		expect(Human.new(1).move).to be_nil
	    	end

	    	it 'should output good string value for color' do
				expect(Human.new(2).color_string).to eq("BLUE")
	    	end

	    end

	end

	describe 'prompting and input' do

		before do
			@a_human = Human.new(2)
		end

		it 'should return false for a bad input \'string\'' do
			expect(@a_human.check_input("asd")).to be false
		end

		it 'should return false for a bad input \'out of bounds\'' do
			expect(@a_human.check_input("0")).to be false
			expect(@a_human.check_input("8")).to be false
		end

		it 'should return true for a good input \'integer\'' do
			expect(@a_human.check_input("1")).to be true
			expect(@a_human.check_input("5")).to be true
			expect(@a_human.check_input("7")).to be true
		end

		it 'should set the correct move' do
			@a_human.check_input("5")
			expect(@a_human.move).to eq(5)
		end

		it 'should get input from user and set move properly' do
			allow(@a_human).to receive(:gets).and_return("2")
			@a_human.get_input
			expect(@a_human.move).to eq(2)
		end

		it 'should get input from user and return a good move' do
			allow(@a_human).to receive(:gets).and_return("6")
			move = @a_human.drop_a_piece
			expect(move).to eq(6)
		end
	end

end