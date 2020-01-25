require 'pry'
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
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
    !@cells.include?(" ")
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def taken?(pos)
    pos = pos.to_i - 1
    @cells[pos] != " "
  end

  def valid_move?(pos)
    !taken?(pos) && pos.to_i.between?(1, 9)
  end

  def update(pos, player)
    pos = pos.to_i - 1
    @cells[pos] = player.token
  end
end
