# Game class should be passed two player objects on instantiation; because both player classes have the same interface, 
# the game should not know nor care what kind of players it is gi
# In your Game class, set the marks of the players you are passed. Include the following methods:

#current_player
#switch_players!
#play_turn, which handles the logic for a single turn
#play, which calls #play_turn each time through a loop until Game#over?
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    attr_accessor :current_player 

    def initialize(board, player1, player2)
        @board = board
        @player1 = player1
        @player2 = player2
        @current_player = @player1
    end

    def switch_players!
        if current_player == @player1
            self.current_player = @player2
        else
            self.current_player = @player1
        end
    end

    def play_turn
        current_player.get_move     
    end

    def play
        unless @board.over?
            play_turn
            switch_players!
        end
    end

end

# require 'rspec/autorun'
# RSpec.describe Game do
#     context "computer vs. computer" do
#         let(:game) do
#             board = Board.new
#             player1 = ComputerPlayer.new(board, :X)
#             player2 = ComputerPlayer.new(board, :O)
#             Game.new(board, player1, player2)
#         end

#         it 'Create new game from scratch' do
#             expect(game).to be_truthy
#         end

#         it 'Play turn with actual player' do
#             p1 = game.current_player
#             game.play
            
#             game.play
#             p2 = game.current_player

#             expect(p1 == p2).to eq true
#         end
#     end
# end


board = Board.new
player1 = HumanPlayer.new(board, :X)
player2 = HumanPlayer.new(board, :O)
game = Game.new(board, player1, player2)
game.play