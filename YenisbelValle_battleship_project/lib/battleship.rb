require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size * 0.5
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print

    end

    def lose?
        if @remaining_misses <= 0
            p 'you lose'
            return true
        else
            false
        end
    end

    def game_over?
        if self.win? || self.lose?
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            return true
        else
            false
        end
    end

    def turn
        position = @player.get_move
        if @board.attack(position) == false
            @remaining_misses -= 1
        end
        @board.print
        p @remaining_misses


    end
end
