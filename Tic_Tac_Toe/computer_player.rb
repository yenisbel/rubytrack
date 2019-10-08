# have an instance variable mark that the game will set on initialize.
# In your ComputerPlayer class,

#display should store the board it's passed as an instance variable, so that get_move has access to it
#get_move should return a position representing a winning move if one is available, and otherwise return a random position
require 'pry'
require_relative 'board'

class ComputerPlayer
    
    attr_reader :board , :mark
    
    def initialize(board, mark)
        @mark = mark
        @board = board
    end 

    def display
        board.grid
    end

    def get_move
        empty_indices = []
        current_grid = display
        
        (0..2).each do |r|
            (0..2).each do |c|
                if board.empty?([r,c])
                    empty_indices << [r,c]
                    current_value = current_grid[r][c]
                    board.place_mark([r,c], @mark)
                    if board.winner == @mark
                        return [r, c]
                    else
                        current_grid[r][c] = current_value
                    end
                end
            end
        end
        result_indx = rand(empty_indices.length - 1)
        position = empty_indices[result_indx]
        board.place_mark(position, @mark)
        return position
    end
end


require 'rspec/autorun'
RSpec.describe ComputerPlayer do
    it 'Do Player winner move' do
        grid = [[:-, :-, :-], [:-, :X, :-], [:-, :-, :X]]
        board = Board.new(grid)
        computer = ComputerPlayer.new(:X, board)
        expect(computer.get_move).to eq [0,0]     
    end

    it 'Do Player winner move with other' do
        grid = [[:X, :-, :-], [:-, :-, :-], [:-, :-, :X]]
        board = Board.new(grid)
        computer = ComputerPlayer.new(:X, board)
        expect(computer.get_move).to eq [1,1]     
    end

    it 'Do Player random move' do
        grid = [[:O, :-, :X], [:O, :X, :X], [:X, :O, :O]]
        board = Board.new(grid)
        computer = ComputerPlayer.new(:X, board)
        expect(computer.get_move).to eq [0,1]     
    end
end