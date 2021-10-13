require "./board.rb"
require "./human_player.rb"

class Game

    def initialize(mv1, mv2)
        @player1 = HumanPlayer.new(mv1)
        @player2 = HumanPlayer.new(mv2)
        @currentPlayer = @player1
        @board = Board.new
    end

    def switch_turn
        @currentPlayer == @player1 ? @currentPlayer = @player2 : @currentPlayer = @player1
    end

    def play
        while @board.empty_positions?
            @board.printBoard
            @board.place_mark(@currentPlayer.get_position, @currentPlayer.mark)
            if @board.win?(@currentPlayer.mark)
                puts "victory"
                return
            else
                self.switch_turn
            end
        end
        puts "draw"
    end
end