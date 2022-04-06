class Player
    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'
        input = gets.chomp
        new_input = input.split(" ")
        return [new_input[0].to_i, new_input[-1].to_i]
    end
end
