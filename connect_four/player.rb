module ConnectFour
  class Player
    attr_reader :marker
    def initialize(marker = "X")
      @marker = marker
      @name = "Player_" + marker
    end

    def insert_disk(board)
      puts "Enter the column index to insert disk '#{marker}' into"
      input = nil
      loop do
        input = gets.chomp
        if input == 'q'
          exit
        else
          if valid?(input, board)
            stack = board.grid[input.to_i]
            break if stack.insert_disk(@marker)
          end
          puts "Please enter a valid input for disk '#{marker}' >"
        end
      end
      puts "#{@name} with marker '#{@marker}' chose column #{input}"
      input.to_i
    end

    def to_s
      @name
    end

    private

    def valid?(input, board)
      return false if !is_number?(input) || input.to_i < 0 || input.to_i >= board.cols
      true
    end

    def is_number? string
      true if Float(string) rescue false
    end
  end

  class AI < Player

    def initialize(marker = "O")
      super
      @name = "AI"
    end

    def insert_disk(board)
      puts "Enter the column index to insert disk '#{marker}' into"
      input = nil
      loop do
        input = (0..6).to_a.sample
        if valid?(input, board)
          stack = board.grid[input.to_i]
          break if stack.insert_disk(@marker)
        end
      end
      puts "#{@name} with marker '#{@marker}' chose column #{input}"
      input
    end
  end

end
