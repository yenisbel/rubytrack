class Board
    attr_reader :size 

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(' ')
        end

    end

    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n * n
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position,value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count{|ele| ele == :S}
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p 'you sunk my battleship!'
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        space_to_cover = @size * 0.25

        while self.num_ships < space_to_cover
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            position = [ row, col ]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |value|
                if value == :S
                    value = :N
                else
                    value
                end
            end
        end
    end

    def cheat
        Board::print_grid(@grid)
    end

    def print
        Board::print_grid(self.hidden_ships_grid)
    end


  
end
