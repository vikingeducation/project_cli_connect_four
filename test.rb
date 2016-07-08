grid = ["X", "X", "X", "X", "O"]

def vertical_win?(grid)
    chunks = grid.chunk { |piece| piece }.map{|a,b| b}
    p chunks
    chunks.any? { |arr| arr.count >= 4 }
end

p vertical_win?(grid)