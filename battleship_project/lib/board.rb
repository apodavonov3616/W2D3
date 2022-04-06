class Board
  def initialize(number)
    small_array = Array.new(number) { :N }
    @grid = Array.new(number) { Array.new(small_array) }
    @size = number * number
  end

  attr_reader :size

  def [](position)
    row = position[0]
    column = position[1]
    @grid[row][column]
  end

  def []=(position, value)
    row = position[0]
    column = position[1]
    @grid[row][column] = value
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S }
  end

  #PART2

  def attack(position)
    if self.[](position)== :S
      self.[]=(position, :H)
      puts 'you sunk my battleship!'
      return true
    else
      self.[]=(position, :X)
      return false
    end
  end

  def place_random_ships
    twenty_five_percent = 0.25 * @grid.flatten.length
    while @grid.flatten.count {|ele| ele == :S } < twenty_five_percent
      row = rand(0...@grid.length)
      column = rand(0...@grid.length)
      @grid[row][column] = :S  
    end
  end

  def hidden_ships_grid
    hidden_ships_grid = @grid.map do |miniArray|
      miniArray.map do |ele|
        if ele == :S  
          :N
        else
          ele
        end
      end
    end
    hidden_ships_grid
  end

  def self.print_grid(arr)
    arr.each { |row| puts row.join(" ") }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

  #

end

