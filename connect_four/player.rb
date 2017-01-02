# All actions related to the Player
module Connect_Four

  class Player
    attr_accessor :name, :piece
    
    # def initialize(name = "Mystery_Player", piece, board)
    def initialize(name, piece, board)
      raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
      @name = name
      @piece = piece
      @board = board
    end

    def get_coordinates
      loop do
          # ask_for_coordinates
          coords = ask_for_coordinates

          # IF validate_coordinates_format is true
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