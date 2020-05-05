module Players
  class Computer < Player

    def move(board)
      sleep 1

      win_combos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

      # see what win combos are possible:
      combos_left = win_combos.select do |combo|
        # select each combo that opponent hasn't blocked
        combo.all? do |pos|
          board.cells[pos] === self.token || board.cells[pos].empty?
        end
      end

      # find all my positions
      my_positions = board.cells.select do |position|
        # puts position
        # puts board.cells
        # puts board.cells[position]
        position == self.token
      end

      potential_wins = combos_left.select do |combo|
        return combo if !(combo & my_positions).empty?
      end


      if !potential_wins.empty?
        # remove my positions already selected
        potential_wins.map!{ |combo| combo.select { |pos| !my_positions.contains?(pos) } }
        potential_wins.sort! { |combo| combo.length}

        potential_wins.first
      else
        valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        valid_moves.sample
      end

    end
  end
end
