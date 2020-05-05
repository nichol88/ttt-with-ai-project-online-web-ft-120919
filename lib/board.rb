class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    system('clear')
    puts ''
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ''
  end

  def position(num)
    @cells[num.to_i - 1]
  end

  def full?
    @cells.all? { |cell| cell == 'X' || cell == 'O'}
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def taken?(pos)
    #puts "Is position #{pos} taken?"
    @cells[pos.to_i-1] == "X" || @cells[pos.to_i-1] == "O"

  end

  def valid_move?(pos)
    puts "checking if move is valid (#{pos})"
    sleep 1
    !taken?(pos) && pos.to_i.between?(1, 9)
  end

  def update(pos, player)
    pos = pos.to_i - 1
    @cells[pos] = player.token
  end
end
