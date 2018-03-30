module MathGame
  class Player

    attr_accessor :name, :lives

    def initialize(name)
      @name = name
      @lives = 3
    end

    def wrong_answer
      @lives -= 1
    end

    def right_answer

    end

  end
end