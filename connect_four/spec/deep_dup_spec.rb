require "deep_dup"

describe Array do

	describe '#deep_dup' do

		describe '#calculate duplicate of arrays' do
    	
	    	it 'can calculate duplicate of 1 deep array' do
	    		test_array = [1,2,3]
	      		dup_array  = test_array.deep_dup
	      		expect(test_array.object_id).not_to eq(dup_array.object_id)
	    	end

	    	it 'can calculate duplicate of 2 deep array' do
	    		test_array = [1,[7,8,9],3]
	      		dup_array  = test_array.deep_dup
	      		expect(test_array.object_id).not_to eq(dup_array.object_id)
	      		expect(test_array[1].object_id).not_to eq(dup_array[1].object_id)
	    	end

	    	it 'can calculate duplicate of 3 deep array' do
	    		test_array = [1,[7,8,9],[2,[3,4,5]]]
	      		dup_array  = test_array.deep_dup
	      		expect(test_array.object_id).not_to eq(dup_array.object_id)
	      		expect(test_array[1].object_id).not_to eq(dup_array[1].object_id)
	      		expect(test_array[2].object_id).not_to eq(dup_array[2].object_id)
	      		expect(test_array[2][1].object_id).not_to eq(dup_array[2][1].object_id)
	    	end
	    end

	end

end