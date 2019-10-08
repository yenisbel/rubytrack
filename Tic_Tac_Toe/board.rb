# *In your Board class, you should have a grid instance variable to keep track of the board tiles. 
# *You should also have the following methods:
    #*place_mark, which takes a position such as [0, 0] and a mark such as :X or :O as arguments. It should raise an error if the position isn't empty.
    #empty?, which takes a position as an argument
    #winner, which should return a mark
    #over?, which should return true or false


class Board
    attr_reader :grid
    def initialize(grid = nil)
        @grid = grid || Array.new(3){Array.new(3, :-)}

    end

    def place_mark(pos, mark)
        if empty?(pos)
            row, col = pos
            @grid[row][col] = mark
        else
           raise "Unexpected error"
        end
    end

    def empty?(pos)
        row, col = pos
        @grid[row][col] == :-
    end

    def winner
        # row combination
        (0..2).each do |row|
            if (0..2).all? { |col| @grid[row][col] == :X }
                return :X
            elsif (0..2).all? { |col| grid[row][col] == :O }
                return :O
            end
        end

        # colum combination
        (0..2).each do |col|
            if (0..2).all? { |row| @grid[row][col] == :X }
                return :X
            elsif (0..2).all? { |row| grid[row][col] == :O }
                return :O
            end
        end

        # left diagonal combination
        if (0..2).all? {|i| @grid[i][i] == :X} 
            return :X
        elsif (0..2).all? {|i| @grid[i][i] == :O} 
            return :O
        end

        # right diagonal combination
        if (0..2).all? {|i| @grid[i][2 - i] == :X} 
            return :X
        elsif (0..2).all? {|i| @grid[i][2 - i] == :O} 
            return :O
        end

    end

    def over?
        won = self.winner
        return true if won == :X || won == :O
        #check if winner = true || tied full marks in grid

        (0..2).each do |row|
            (0..2).each do |col|
                return false if @grid[row][col] == :-
            end
        end
        true
    end

end






require 'rspec/autorun'
RSpec.describe Board do
    let(:board) do 
        Board.new
    end
    it 'Create new board for Tic Tac Toe' do
        result = [[:-, :-, :-], [:-, :-, :-], [:-, :-, :-]]
        expect(board.grid).to eq result
    end

    context ':place_mark' do
        it 'Put mark using coordenates if is position empty' do
            result = [[:X, :-, :-], [:-, :-, :-], [:-, :-, :-]]
            board.place_mark([0,0], :X)
            expect(board.grid).to eq result
            
        end

        it 'raise an error if the position is not empty' do
            error_result = "Unexpected error"
            board.place_mark([0,0], :X)
            
            expect { board.place_mark([0,0], :X) }.to raise_error(error_result)
            
        end
    end

    it 'Check if the position is not occupied' do
        expect(board.empty?([0,0])).to eq true
    end

    it 'Check if the position is occupied' do
        board.place_mark([0,0], :X)
        expect(board.empty?([0,0])).to eq false
    end

    context ':winner' do
        it 'Check row combination' do
            grid = [[:X, :X, :X], [:-, :-, :-], [:-, :-, :-]]
            current = Board.new(grid)
            expect(current.winner).to eq :X
            
        end

        it 'Check column combination' do
            grid = [[:-, :X, :-], [:-, :X, :-], [:-, :X, :-]]
            current = Board.new(grid)
            expect(current.winner).to eq :X
            
        end

        it 'Check left diagonal combination' do
            grid = [[:X, :-, :-], [:-, :X, :-], [:-, :-, :X]]
            current = Board.new(grid)
            expect(current.winner).to eq :X
            
        end

        it 'Check rigth diagonal combination' do
            grid = [[:-, :-, :X], [:-, :X, :-], [:X, :-, :-]]
            current = Board.new(grid)
            expect(current.winner).to eq :X
            
        end

        it 'No winner return nil' do
            expect(board.winner).to eq nil
        end
    end

    context 'End of the game over?' do
        it 'Game return true if player won' do
            grid = [[:X, :-, :-], [:-, :X, :-], [:-, :-, :X]]
            current = Board.new(grid)
            expect(current.over?).to eq true
        end

        it 'Game return true if was tied' do
            grid = [[:O, :O, :X], [:O, :X, :X], [:X, :O, :O]]
            current = Board.new(grid)
            expect(current.over?).to eq true
        end

        it 'Game return false' do
            expect(board.over?).to eq false
        end
    end

end
