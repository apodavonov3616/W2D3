require_relative "board"
require_relative "player"

class Battleship
    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = length*length / 2
    end

    attr_reader :board, :player

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        while @remaining_misses > 0
            return false
        end
        puts 'you lose'
        return true
    end

    def win?
        if @board.num_ships == 0
            puts 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        return true if win? || lose?
        false
    end

    def turn 
        input = @player.get_move
        if @board.attack(input)==false
            @remaining_misses-=1
        end
        @board.print
        puts @remaining_misses
    end
end
