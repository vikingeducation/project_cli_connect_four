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
      @smart = true
    end

    def insert_disk(board)
      puts "Enter the column index to insert disk '#{marker}' into"
      input = nil
      loop do
        input = @smart ? smart_input(board) : (0..6).to_a.sample
        if valid?(input, board)
          stack = board.grid[input.to_i]
          break if stack.insert_disk(@marker)
        end
      end
      puts "#{@name} with marker '#{@marker}' chose column #{input}"
      input
    end

    def smart_input(board)
      smart_input = nil
      (0..6).each do |col_idx|
        if board.check_winner(col_idx, false, @marker)
          # puts "Smart input : #{col_idx}"
          smart_input = col_idx
          break
        end
      end
      smart_input || smart_input = (0..6).to_a.sample
      # puts "Smart input : #{smart_input}"
      smart_input
    end
  end

end
