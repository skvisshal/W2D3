require "./board.rb"
require "./human_player.rb"
require "./computer_player.rb"

class Game

    def initialize(size, hash)
        @players = []
        hash.each do |mark_value, type| 
            !type ? @players.push(HumanPlayer.new(mark_value)) : @players.push(ComputerPlayer.new(mark_value))
        end
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
            @board.place_mark(@currentPlayer.get_position(@board.legal_positions), @currentPlayer.mark)
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