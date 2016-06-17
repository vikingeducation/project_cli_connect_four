class Board


# the board will only display the current status
def self.render( board )

	board.each do |k, row| print "#{k}--"
		row.each { | col | print col }
		puts ""

	end

end
# display messages to the user

def self.message( message )

	puts ""
	puts message
	puts ""

end



end