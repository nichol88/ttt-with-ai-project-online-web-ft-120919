module Players
  class Computer < Player

    def move(board)
      sleep 1
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.sample
    end

  end
end
