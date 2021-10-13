require "./board.rb"
require "./human_player.rb"

class Game

    def initialize(size, *mark_values)
        @players = []
        mark_values.each {|mark_value| @players.push(HumanPlayer.new(mark_value))}
        @currentPlayer = @players[0]
        @board = Board.new(size)
    end

    def switch_turn
        @players.rotate!
        @currentPlayer = @players[0]
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