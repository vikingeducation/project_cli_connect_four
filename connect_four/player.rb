# All actions related to the Player
module Connect_Four

  class Player
    attr_accessor :name, :piece
    
    # def initialize(name = "Mystery_Player", piece, board)
    def initialize(name, piece, board)
      # Set marker type (e.g. X or O)
      raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
      @name = name
      @piece = piece
      @board = board
    end

    # get_coordinates
    def get_coordinates
      # loop infinitely
      loop do
          # ask_for_coordinates
          coords = ask_for_coordinates

          # IF validate_coordinates_format is true
          if validate_coordinates_format(coords)
              # IF piece can be placed on Board
              if @board.add_piece(coords, @piece)
                  # break the loop
                  break
              end
          end
      end
    end

    # ask_for_coordinates
    def ask_for_coordinates
      puts "#{@name}(#{@piece}), enter your coordinates in the form x,y:"

      # user_input = gets.chomp.strip.split(",").map(&:to_i)
      user_input = gets.chomp.strip.split(",")
      user_input.map {|x| x.to_i}

      # user_input.each do |value|
      #   user_input.to_i
      # end
    end

    # validate_coordinates_format
    def validate_coordinates_format(coords)
      if coords.is_a?(Array) && coords.size == 2
          true
      else
          puts "Your coordinates are in the improper format!"
      end
    end
  end
end