# All actions related to the Player
module Connect_Four

  class Human < Player
    attr_accessor :name, :piece
    
    def initialize(name, piece, board)
      raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
      super(name, piece, board)
    end

    def get_coordinates
      loop do
          coords = ask_for_coordinates

          if validate_coordinates_format(coords)
              if @board.add_piece(coords, @piece)
                  break
              end
          end
      end
    end

    def ask_for_coordinates
      puts "#{@name}(#{@piece}), enter your coordinates in the form x,y:"
      user_input = gets.chomp.strip.split(",")
      user_input.map {|x| x.to_i}
    end

    def validate_coordinates_format(coords)
      if coords.is_a?(Array) && coords.size == 2
          true
      else
          puts "Your coordinates are in the improper format!"
      end
    end
  end
end