class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    attr_reader :mark

    def get_position

        begin
            puts "Player #{@mark}, please enter the coordinates with a space in between:"
            num = gets.chomp.split(" ")
    
            if num.length != 2
                raise ArgumentError.new "please give two inputs"
            end
    
            num.map! { |ele| ele.to_i }
        rescue
            puts "Invalid Entry"
            retry
        end
        
    end
end