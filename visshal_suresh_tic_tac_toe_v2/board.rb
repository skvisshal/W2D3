class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    def valid?(pos)
        (pos[0] < @grid.length && pos[0] >= 0) && (pos[1] < @grid[0].length && pos[1] >= 0)
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == "_"
    end

    def place_mark(pos, mark)
        if self.valid?(pos) && self.empty?(pos)
            @grid[pos[0]][pos[1]] = mark
        else
            raise "invalid mark"
        end
    end

    def printBoard
        @grid.each do |row|
            row.each.with_index do |ele, i|
               print i != row.length-1 ? ele.to_s + " " : ele.to_s
            end
            print "\n"
        end
    end
    
    def win_row?(mark)
        @grid.any? {|row| row.all? {|ele| ele == mark}}
    end

    def win_col?(mark)
        (0...@grid[0].length).any? do |i|
            (0...@grid.length).all? do |j|
                @grid[j][i] == mark
            end
        end
    end

    def win_diagonal?(mark)
        (0...@grid.length).all? {|i| @grid[i][i] == mark} || (0...@grid.length).all? {|i| @grid[i][@grid.length - 1 - i] == mark}
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end
    
    def empty_positions?
        @grid.any? {|row| row.any? {|ele| ele == "_"}}
    end
        

end