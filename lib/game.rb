class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    cells = @board.cells
    WIN_COMBINATIONS.each do |combination|
      check = combination.map{ |position| cells[position]}
      return combination if check == ['X', 'X', 'X'] || check == ['O', 'O', 'O']
    end
    false
  end

  def draw?
    @board.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    return nil if !won?
    @board.cells[self.won?[0]] == 'X' ? 'X' : 'O'
  end

  def turn
    puts 'Make selection:'
    selection = current_player.move(@board)
    puts "#{selection}"
    turn if !@board.valid_move?(selection)
    @board.update(selection, current_player)
  end

  def play
    @board.display
    if !over?

      turn
      play
    else
      puts "Congratulations #{winner}!" if won?
      puts "Cat's Game!" if draw?
    end
  end
end
