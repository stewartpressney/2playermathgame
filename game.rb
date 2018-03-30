module MathGame
  class Game

    attr_accessor :turn

    def initialize
      @turn = 0
    end

    def nextTurn
      @turn += 1
    end

  end

end