require "player"

describe Player do 

    let (:player) { Player.new(:X) }

    describe "#initialize" do 
      
      it "should raise an argument error if no input is passed when a new player is created" do 
        expect{Player.new()}.to raise_error(ArgumentError)
      end

      it "should save the player's piece when a piece is passed in as argument" do 
        expect(Player.new(:X).piece).to eq(:X)
      end

      it "should set the column to nil" do
        expect(Player.new(:X).column).to eq(nil)
      end

    end

    describe "#move" do 

      it "should get the column number and convert it to 0 indexing from the player" do 
        allow(player).to receive(:gets).and_return("1")
        expect(player.move).to eq("1".to_i - 1)
      end

      it "should get the column number 7 and return 6" do 
        allow(player).to receive(:gets).and_return("7")
        expect(player.move).to eq("7".to_i - 1)
      end

    end

    describe "#valid?" do 

      it "should return true if player chooses column 4" do 
        player.instance_variable_set(:@column, 4)
        expect(player.valid?).to be true
      end

      it "should return true if player chooses column 6" do 
        player.instance_variable_set(:@column, 6)
        expect(player.valid?).to be true
      end

      it "should return false if player chooses column 0" do 
        player.instance_variable_set(:@column, 0) 
        expect(player.valid?).to be false
      end

      it "should return false if player chooses column 8" do 
        player.instance_variable_set(:@column, 8)
        expect(player.valid?).to be false
      end

    end

end