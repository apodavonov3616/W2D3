class Board
    attr_accessor :grid
    def initialize(length)
        @grid = Array.new(length) { Array.new(length, "_") }
    end

    def valid(position)
        row = position[0].to_i
        
        column = position[1].to_i
        if row < @grid.length && column < @grid.length && row>=0 && column >=0
            return true
        else
            return false
        end
    end

    def empty?(position)
        row = position[0].to_i
        column = position[1].to_i
        if @grid[row][column] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        begin
            if !valid(position)
                raise "not valid spot"
            elsif !empty?(position)
                raise "not empty spot"
            else
                row = position[0].to_i
                column = position[1].to_i
                # @grid[position[0].to_i, position[1].to_i] = mark
                @grid[row][column] = mark
            end
        rescue 
            print "not a valid entry"
        end
    end

    def print
        @grid
    end

    def win_row?(mark)
        @grid.any? do |miniArray|
            miniArray.all? do |ele|
                mark == ele
            end 
        end
    end

    def win_col?(mark)
        empty_array = []
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                empty_array << @grid[j][i]
            end
            return true if empty_array.all? { |ele| ele == mark }
            empty_array = []
        end
        false
    end

    def win_diagonal?(mark)
        magic_number = @grid.length-1
        weird_diagonal = []
        (0...@grid.length).each do |idx|
            weird_diagonal << @grid[idx][magic_number-idx]
        end
        return true if weird_diagonal.all? { |ele| ele == mark }

        normal_diagonal = []
        (0...grid.length).each do |idx|
            normal_diagonal << @grid[idx][idx]
        end
        return true if normal_diagonal.all? { |ele| ele == mark }
        false
    end

    def win?(mark)
        return true if self.win_col?(mark) || self.win_diagonal?(mark) || self.win_row?(mark)
    end

    def empty_positions?
        #iterate through grid, iterate through mini Array, use any for both to find "_"
        @grid.any? do |miniArray|
            miniArray.any? do |ele|
                ele == "_"
            end
        end
    end
end
