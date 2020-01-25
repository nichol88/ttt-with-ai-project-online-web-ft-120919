module Players
  class Human < Player

    def move(board)
      #puts "What's your move?"
      i = gets.strip
      return i
    end

  end
end
