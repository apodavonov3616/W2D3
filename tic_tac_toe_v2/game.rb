require_relative "./human_player.rb"
require_relative "./board.rb"

class Game
    def initialize( length_of_board, *players_marks)
        # @player_1 = HumanPlayer.new(player_1_mark)
        # @player_2 = HumanPlayer.new(player_2_mark)
        @all_players = []
        players_marks.each_with_index do |incoming_player_mark, idx|
            @idx = HumanPlayer.new(incoming_player_mark)
            @all_players << @idx
        end
        @board = Board.new(length_of_board)
        @all_players = @all_players.flatten
        @current_player = @all_players[0]
    end

    attr_reader :board, :current_player, :all_players

    def switch_turn
        current_index = @all_players.index(@current_player)
        divisor = @all_players.length
        next_index = (current_index + 1) % divisor
        @current_player = @all_players[next_index]
    end

    def play
        while @board.empty_positions?
            p @board.print
            begin
                input = @current_player.get_position
                @board.place_mark(input, @current_player.mark)
            rescue
                puts "Invalid Entry"
                retry
            end
            if @board.win?(@current_player.mark)
                puts 'victory. #{@current_player} has won!'
                return
            else
                self.switch_turn
            end
        end
        print 'draw'
    end

end