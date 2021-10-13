class Board

    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](array)
        @grid[array[0]][array[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.inject(0) {|acc, row| acc + row.count {|ele| ele == :S}}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        total_ship_count = 0.25 * @size
        while self.num_ships != total_ship_count
            pos = [rand(0...@grid.length),rand(0...@grid[0].length)]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            row.each.with_index do |ele, i|
               print i != row.length-1 ? ele.to_s + " " : ele.to_s
            end
            print "\n"
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
