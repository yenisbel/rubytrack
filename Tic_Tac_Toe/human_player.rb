# In both player classes, have an instance variable mark that the game will set on initialize.

# In your HumanPlayer class,

#display should print the board out to the console, you should format the output nicely.
#get_move should allow the player to enter a move of the form '0, 0', and return it as a position of the form [0, 0]

require_relative 'board'

class HumanPlayer

    def initialize(board, mark)
        @mark = mark
        @board = board
    end

    def get_move
        display
        puts "Enter your move position"
        format = gets.chomp
        position = format.split(",").map{|v| v.to_i}
        @board.place_mark(position, @mark)
        position
    end

    def display
        (0..2).each {|i| puts @board.grid[i] }
    end
end
